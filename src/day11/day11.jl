module Day11

using AdventOfCode2020

function day11(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    seats = reduce(vcat, permutedims.(collect.(split(input))))
    return [solve(seats, 4, count_seats_part1), solve(seats, 5, count_seats_part2)]
end

function solve(seats::Array{Char,2}, occupied_rule::Int, countf)
    state_changed = true
    m, n = size(seats)
    while state_changed
        state_changed = false
        nseats = collect(seats)
        for i = 1:m
            for j = 1:n
                if seats[i, j] != '.'
                    c = countf(seats, i, j, '#')
                    if seats[i, j] == '#' && c >= occupied_rule
                        nseats[i, j] = 'L'
                        state_changed = true
                    elseif seats[i, j] == 'L' && c == 0
                        nseats[i, j] = '#'
                        state_changed = true
                    end
                end
            end
        end
        seats = nseats
    end
    return count(i -> (i == '#'), seats)
end

function count_seats_part1(seats::Array{Char,2}, i::Int, j::Int, char::Char)
    sub = (seats[i, j] == char) ? 1 : 0
    return count(x -> (x == char), get(seats, (i-1:i+1, j-1:j+1), 'b')) - sub
end

function count_seats_part2(seats::Array{Char,2}, i::Int, j::Int, char::Char)
    c = 0
    for Δx in (-1, 0, 1)
        for Δy in (-1, 0, 1)
            (Δx == 0 && Δy == 0) && continue
            x, y = i, j
            while true
                x += Δx
                y += Δy
                !(x >= 1 && x <= size(seats)[1]) && break
                !(y >= 1 && y <= size(seats)[2]) && break
                if seats[x, y] == char
                    c += 1
                    break
                elseif seats[x, y] == '.'
                    continue
                else
                    break
                end
            end
        end
    end
    return c
end

end  # module
