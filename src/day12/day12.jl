module Day12

using AdventOfCode2020

function day12(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    instructions = parse_input(input)
    return [part1(instructions), part2(instructions)]
end

function parse_input(input::String)
    sinput = split(input)
    instructions = Array{Tuple{Char,Int},1}(undef, length(sinput))
    for (i, line) in enumerate(sinput)
        m = match(r"(N|S|E|W|L|R|F)(\d+)", line)
        m == nothing && AssertionError("Invalid input")
        m[1] in ('L', 'R') && m % 90 != 0 && AssertionError("only multiples of 90 degrees are supported")
        instructions[i] = (m[1][1], parse(Int, m[2]))
    end
    return instructions
end

function part1(instructions::Array{Tuple{Char,Int},1})
    direction = [1, 0]
    position = [0, 0]
    L = [0 -1; 1 0]
    R = [0 1; -1 0]
    for (com, val) in instructions
        if com == 'N'
            position[2] += val
        elseif com == 'S'
            position[2] -= val
        elseif com == 'E'
            position[1] += val
        elseif com == 'W'
            position[1] -= val
        elseif com == 'L'
            n = val ÷ 90
            direction = L^n * direction
        elseif com == 'R'
            n = val ÷ 90
            direction = R^n * direction
        elseif com == 'F'
            position += val * direction
        end
    end
    return abs.(position) |> sum
end

function part2(instructions::Array{Tuple{Char,Int},1})
    position = [0, 0]
    waypoint = [10, 1]
    L = [0 -1; 1 0]
    R = [0 1; -1 0]
    for (com, val) in instructions
        if com == 'N'
            waypoint[2] += val
        elseif com == 'S'
            waypoint[2] -= val
        elseif com == 'E'
            waypoint[1] += val
        elseif com == 'W'
            waypoint[1] -= val
        elseif com == 'L'
            n = val ÷ 90
            waypoint = L^n * waypoint
        elseif com == 'R'
            n = val ÷ 90
            waypoint = R^n * waypoint
        elseif com == 'F'
            position += val * waypoint
        end
    end
    return abs.(position) |> sum
end

end  # module
