module Day15

using AdventOfCode2020

function day15(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    numbers = parse.(Int, split(rstrip(input), ","))
    return [solve(numbers, 2020), solve(numbers, 30_000_000)]
end

function solve(numbers::Array{Int,1}, N::Int)
    lastpos = Dict{Int,Int}()
    for (i, v) in enumerate(numbers[1:end-1])
        lastpos[v] = i
    end
    last = numbers[end]
    for i = length(numbers) : N-1
        if haskey(lastpos, last)
            tmp = last
            last = i - lastpos[last]
            lastpos[tmp] = i
        else
            lastpos[last] = i
            last = 0
        end
    end
    return last
end

end  # module
