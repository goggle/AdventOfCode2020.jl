module Day23

using AdventOfCode2020

function day23(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    numbers = parse.(Int, split(rstrip(input), ""))
    list1 = play(numbers, 100)
    list2 = play(numbers, 10_000_000, extend = true)
    return [part1(list1), part2(list2)]
end

abstract type AbstractLinkedList{T} end
abstract type AbstractNode{T} end

mutable struct Node{T} <: AbstractNode{T}
    next::Node{T}
    data::T
    Node{T}() where T =(x=new(); x.next=x; x)
    Node{T}(n::Node{T}, d::T) where T =new(n, d)
end
Node(n::Node{T}, d::T) where T =SListNode{T}(n, d)

mutable struct LinkedList{T} <: AbstractLinkedList{T}
    node::Node{T}
end

function play(numbers::Array{Int,1}, N::Int; extend = false)
    len = 9
    if extend
        len = 1_000_000
    end

    nodes = [Node{Int}() for x in numbers]
    nlist = Array{Node{Int},1}(undef, len)
    for (i, node) in enumerate(nodes)
        node.next = nodes[mod1(i + 1, length(nodes))]
        node.data = numbers[i]
        nlist[node.data] = node
    end

    if extend
        node = Node{Int}(nodes[1], 1_000_000)
        nlist[1_000_000] = node
        @inbounds for i = 999_999:-1:10
            node = Node{Int}(node, i)
            nlist[i] = node
        end
        nodes[9].next = node
    end

    list = LinkedList{Int}(nodes[1])

    current = list.node
    for n = 1:N
        destval = current.data
        found = false
        destination = current
        while true
            destval = mod1(destval - 1, len)
            if !(current.next.data == destval || current.next.next.data == destval || current.next.next.next.data == destval)
                destination = nlist[destval]
                break
            end
        end
        first = current.next
        last = current.next.next.next
        current.next = current.next.next.next.next
        last.next = destination.next
        destination.next = first

        current = current.next
    end
    return list
end

function part1(list::LinkedList{Int})
    onenode = list.node
    while onenode.data != 1
        onenode = onenode.next
    end
    c = onenode.next
    res = []
    while c.data != 1
        push!(res, c.data)
        c = c.next
    end
    return parse(Int, join(res))
end

function part2(list::LinkedList{Int})
    onenode = list.node
    while onenode.data != 1
        onenode = onenode.next
    end
    one = onenode.next
    two = one.next
    return one.data * two.data
end

end  # module
