module Day23

using AdventOfCode2020

function day23(input::String = readInput(joinpath(@__DIR__, "..", "data", "day23.txt")))
    numbers = parse.(Int, split(rstrip(input), ""))
    return [part1(numbers), part2(numbers)]
end

function part1(numbers)
    list = play(numbers, 100)
    arr = similar(list)
    i = 1
    for j = 2:length(list)
        arr[j] = list[i]
        i = arr[j]
    end
    return parse(Int, join(arr[2:end]))
end

function part2(numbers)
    list = play(numbers, 10_000_000, extend = true)
    return convert(Int64, list[1]) * list[list[1]]
end

function play(numbers::Array{Int,1}, N::Int; extend = false)
    if !extend
        len = 9
        list = Array{Int32,1}(undef, 9)
    else
        len = 1_000_000
        list = Array{Int32,1}(undef, 1_000_000)
    end

    i = numbers[1]
    for j = 2:9
        list[i] = numbers[j]
        i = numbers[j]
    end
    list[i] = numbers[1]
    if extend
        list[i] = 10
        list[10:end] = collect(11:1_000_001)
        list[end] = numbers[1]
    end

    current = numbers[1]
    for n = 1:N
        destval = current
        first = list[current]
        second = list[first]
        third = list[second]
        while true
            destval = mod1(destval - 1, len)
            if destval ∉ (first, second, third)
                break
            end
        end
        list[current] = list[third]
        list[third] = list[destval]
        list[destval] = first

        current = list[current]
    end
    return list
end

end  # module
