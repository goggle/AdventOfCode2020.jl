module Day10

using AdventOfCode2020

function day10(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    sjoltages = sort(parse.(Int, split(input)))
    return [part1(sjoltages), part2(sjoltages)]
end

function part1(sj::Array{Int,1})
    diffs = [sj; sj[end] + 3] - [0; sj]
    return count(i->(i==1), diffs) * count(i->(i==3), diffs)
end

function part2(sj::Array{Int,1})
    groups = Array{Int,1}()
    n = 1
    for v in [sj; sj[end] + 3] - [0; sj]
        if v == 1
            n += 1
        else
            if n >= 3
                push!(groups, n)
            end
            n = 1
        end
    end
    d = Dict(3=>2, 4=>4, 5=>7)
    return prod(i->d[i], groups)
end

end  # module
