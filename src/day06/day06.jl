module Day06

using AdventOfCode2020

function day06(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    spinput = split(strip(input), "\n\n")
    part1 = replace.(spinput, "\n"=>"") .|> unique .|> length |> sum

    inp = split.(spinput, "\n")
    part2 = 0
    for ans in inp
        part2 += intersect(collect.(ans)...) |> length
    end
    return [part1, part2]
end

end # module
