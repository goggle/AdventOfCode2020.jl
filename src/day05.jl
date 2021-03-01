module Day05

using AdventOfCode2020

function day05(input::String = readInput(joinpath(@__DIR__, "..", "data", "day05.txt")))
    seats = [get_seat_id(code) for code in split(input)]
    return [maximum(seats), part2(seats)]
end

function get_seat_id(code::AbstractString)
    rlow, rhigh = 0, 127
    for i = 1:7
        rmid = rlow + (rhigh - rlow) ÷ 2
        if code[i] == 'F'
            rhigh = rmid
        elseif code[i] == 'B'
            rlow = rmid + 1
        end
    end

    clow, chigh = 0, 7
    for i = 8:10
        cmid = clow + (chigh - clow) ÷ 2
        if code[i] == 'L'
            chigh = cmid
        elseif code[i] == 'R'
            clow = cmid + 1
        end
    end

    return rlow * 8 + clow
end

function part2(seats::Array{Int,1})
    m, M = 0, 127 * 8 + 7
    missing_seats = [x for x in m:M if !(x in seats)]
    for seat in missing_seats
        if (seat - 1) in seats && (seat + 1) in seats
            return seat
        end
    end
end

end # module
