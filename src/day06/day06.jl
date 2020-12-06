module Day06

using AdventOfCode2020

function day06(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    part1 = replace.(split(input, "\n\n"), "\n"=>"") .|> unique .|> length |> sum

    inp = split.(split(strip(input), "\n\n"), "\n")
    part2 = 0
    for ans in inp
        part2 += intersect(collect.(ans)...) |> length
    end
    return [part1, part2]
end

end # module
