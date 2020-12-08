module Day08

using AdventOfCode2020

function day08(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    instructions = []
    for line in split(input, "\n")
        arr = split(line, " ")
        length(arr) <= 1 && break
        push!(instructions, (strip(arr[1]), parse(Int, strip(arr[2]))))
    end
    p1 = execute_program(instructions)[1]
    return [p1, part2(instructions)]
end

function execute_program(instructions; flipindex = -1)
    accumulator = 0
    visited = zeros(Bool, length(instructions))
    ind = 1
    while true
        if ind == length(instructions) + 1
            return accumulator, true
        end
        if visited[ind]
            return accumulator, false
        end
        visited[ind] = true

        cmd = instructions[ind][1]
        if ind == flipindex
            if cmd == "jmp"
                cmd = "nop"
            elseif cmd == "nop"
                cmd = "jmp"
            end
        end

        if cmd == "acc"
            accumulator += instructions[ind][2]
            ind += 1
            continue
        end
        if cmd == "jmp"
            ind += instructions[ind][2]
            continue
        end
        if cmd == "nop"
            ind += 1
            continue
        end
    end
end

function part2(instructions)
    for (i, instruction) in enumerate(instructions)
        if instruction[1] in ("jmp", "nop")
            acc, terminates = execute_program(instructions, flipindex=i)
            if terminates
                return acc
            end
        end
    end
end

end # module
