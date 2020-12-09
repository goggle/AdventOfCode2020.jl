module Day09

using AdventOfCode2020

function day09(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    numbers = parse.(Int, split(strip(input), "\n"))
    p1 = part1(numbers, 25)
    return [p1, part2(numbers, p1)]
end

function part1(numbers, nprev)
    for i in (nprev+1):length(numbers)
        found = false
        for j in (i-1):-1:(i-nprev)
            for k in (j-1):-1:(i-nprev)
                if numbers[i] == numbers[j] + numbers[k]
                    found = true
                    @goto ok
                end
            end
        end
        @label ok
        if !found
            return numbers[i]
        end
    end
end

function part2(numbers, invnumber)
    for i in 1:length(numbers)
        s = numbers[i]
        for j in (i+1):length(numbers)
            s += numbers[j]
            if s == invnumber
                return minimum(numbers[i:j]) + maximum(numbers[i:j])
            elseif s > invnumber
                break
            end
        end
    end
end

end # module
