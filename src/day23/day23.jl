module Day23

using AdventOfCode2020

function day23(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    numbers = parse.(Int, split(rstrip(input), ""))
    p1 = part1!(deepcopy(numbers), 100)
    return [p1, 0]
end

function part1!(cups::Array{Int,1}, n::Int)
    curri = 1
    for k = 1:n
        three = [mod1(curri + i, length(cups)) for i = 1:3]
        destval = mod1(cups[curri] - 1, length(cups))
        decr = 1
        while destval ∈ cups[three]
            destval = mod1(cups[curri] - decr, length(cups))
            decr += 1
        end
        desti = findfirst(isequal(destval), cups)
        tmp = similar(cups)
        tmp[curri] = cups[curri]
        i = mod1(curri + 4, length(cups))
        j = mod1(curri + 1, length(cups))
        while i != desti
            tmp[j] = cups[i]
            i = mod1(i + 1, length(cups))
            j = mod1(j + 1, length(cups))
        end
        tmp[j] = cups[i]
        for l = 1:3
            j = mod1(j + 1, length(cups))
            tmp[j] = cups[three[l]]
        end
        i = mod1(i + 1, length(cups))
        j = mod1(j + 1, length(cups))
        while i != curri
            tmp[j] = cups[i]
            i = mod1(i + 1, length(cups))
            j = mod1(j + 1, length(cups))
        end
        curri = mod1(curri + 1, length(cups))
        cups = tmp
    end
    oneind = findfirst(isequal(1), cups)
    i = mod1(oneind + 1, length(cups))
    result = []
    while i != oneind
        push!(result, cups[i])
        i = mod1(i + 1, length(cups))
    end
    return parse(Int, join(result))
end

end  # module
