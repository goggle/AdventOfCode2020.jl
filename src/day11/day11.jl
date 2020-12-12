module Day11

using AdventOfCode2020

function day11(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    seats = reduce(vcat, permutedims.(collect.(split(input))))
    return [solve(seats, 4, count_seats_part1), solve(seats, 5, count_seats_part2)]
end

function solve(seats::Array{Char,2}, occupied_rule::Int, countf)
    state_changed = true
    m, n = size(seats)
    cseats = collect(seats)
    nseats = collect(seats)
    while state_changed
        state_changed = false
        for i = 1:m
            for j = 1:n
                if cseats[i, j] != '.'
                    c = countf(cseats, i, j, '#')
                    if cseats[i, j] == '#' && c >= occupied_rule
                        nseats[i, j] = 'L'
                        state_changed = true
                    elseif cseats[i, j] == 'L' && c == 0
                        nseats[i, j] = '#'
                        state_changed = true
                    end
                end
            end
        end
        copy!(cseats, nseats)
    end
    return count(i -> (i == '#'), cseats)
end

function count_seats_part1(seats::Array{Char,2}, i::Int, j::Int, char::Char)
    c = 0
    for Δx in (-1, 0, 1)
        for Δy in (-1, 0, 1)
            (Δx == 0 && Δy == 0) && continue
            x, y = i + Δx, j + Δy
            !(x >= 1 && x <= size(seats)[1]) && continue
            !(y >= 1 && y <= size(seats)[2]) && continue
            if seats[x, y] == char
                c += 1
            end
        end
    end
    return c
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
