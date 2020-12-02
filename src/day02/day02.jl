module Day02

using AdventOfCode2020

function day02(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    part1, part2 = 0, 0
    for line in split(input, "\n")
        m = match(r"(\d+)-(\d+)\s+(.):\s+(.+)", line)
        if m == nothing
            break
        end
        low = parse(Int, m.captures[1])
        high = parse(Int, m.captures[2])
        char = m.captures[3][1]
        if _is_valid_part1(low, high, char, m.captures[4])
            part1 += 1
        end
        if _is_valid_part2(low, high, char, m.captures[4])
            part2 += 1
        end
    end
    return [part1, part2]
end

function _is_valid_part1(low::Int, high::Int, char::Char, password::AbstractString)
    n = 0
    for c in password
        if c == char
            n += 1
        end
    end
    return low <= n <= high
end

function _is_valid_part2(low::Int, high::Int, char::Char, password::AbstractString)
    return (password[low] == char && password[high] != char) || (password[high] == char && password[low] != char)
end

end # module
