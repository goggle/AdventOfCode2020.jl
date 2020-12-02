module Day01

using AdventOfCode2020

function day01(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    values = parse.(Int, split(input))
    return [part1(values), part2(values)]
end

function part1(values::Array{Int,1})
    for (i, vi) in enumerate(values)
        for vj in Iterators.rest(values, i + 1)
            vi + vj == 2020 && return vi * vj
        end
    end
end

function part2(values::Array{Int,1})
    for (i, vi) in enumerate(values)
        for (j, vj) in enumerate(Iterators.rest(values, i + 1))
            sum = vi + vj
            sum > 2020 && continue
            for vk in Iterators.rest(values, i + j + 1)
                sum + vk == 2020 && return vi * vj * vk
            end
        end
    end
end

end # module
