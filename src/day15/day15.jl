module Day15

using AdventOfCode2020

function day15(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    numbers = parse.(Int, split(rstrip(input), ","))
    return [solve(numbers, 2020), solve(numbers, 30_000_000)]
end

function solve(numbers::Array{Int,1}, N::Int)
    lastpos = zeros(Int32, N+1)
    for (i, v) in enumerate(numbers[1:end-1])
        lastpos[v+1] = i
    end
    last = numbers[end]
    for i = length(numbers) : N-1
        if lastpos[last+1] != 0
            tmp = last
            last = i - lastpos[last+1]
            lastpos[tmp+1] = i
        else
            lastpos[last+1] = i
            last = 0
        end
    end
    return last
end

end  # module
