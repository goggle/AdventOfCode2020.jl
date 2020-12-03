module Day02

using AdventOfCode2020

function day02(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    part1, part2 = 0, 0
    for line in split(input, "\n")
        m = match(r"(\d+)-(\d+)\s+(.):\s+(.+)", line)
        m == nothing && break
        low = parse(Int, m.captures[1])
        high = parse(Int, m.captures[2])
        char = m.captures[3][1]
        pw = m.captures[4]
        if low <= count(c->c==char, pw) <= high
            part1 += 1
        end
        if xor(pw[low] == char, pw[high] == char)
            part2 += 1
        end
    end
    return [part1, part2]
end

end # module
