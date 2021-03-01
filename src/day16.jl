module Day16

using AdventOfCode2020

function day16(input::String = readInput(joinpath(@__DIR__, "..", "data", "day16.txt")))
    input_sections = split(rstrip(input), "\n\n")
    nrestrictions = count(c->c=='\n', input_sections[1]) + 1
    restrictions = Array{Array{UnitRange,1},1}(undef, nrestrictions)
    names = Array{String,1}(undef, nrestrictions)
    for (i, line) in enumerate(split(input_sections[1], "\n"))
        m = match(r"(.+?)\s*:\s*(\d+)\s*-\s*(\d+).+?(\d+)\s*-\s*(\d+)", line)
        restrictions[i] = [parse(Int, m[2]):parse(Int, m[3]), parse(Int, m[4]):parse(Int, m[5])]
        names[i] = m[1]
    end

    ticket = parse.(Int, split(split(input_sections[2], "\n")[2], ","))

    nnt = count(c->c=='\n', input_sections[3])
    nearby_tickets = fill(zeros(Int, length(ticket)), nnt)
    for (i, line) in enumerate(split(input_sections[3], "\n")[2:end])
        nearby_tickets[i] = parse.(Int, split(line, ","))
    end

    part1 = 0
    valid_tickets = Array{Array{Int,1},1}()
    for nticket in nearby_tickets
        tok = true
        for n in nticket
            ok = false
            for v in restrictions
                for r in v
                    if n in r
                        ok = true
                    end
                end
            end
            if !ok
                part1 += n
                tok = false
            end
        end
        if tok
            push!(valid_tickets, nticket)
        end
    end

    A = Array{Array{Int,1}, 2}(undef, length(valid_tickets), length(valid_tickets[1]))
    for i = 1:length(valid_tickets)
        for j = 1:length(valid_tickets[1])
            A[i,j] = Array{Int,1}()
        end
    end
    for (i, nearby_ticket) in enumerate(valid_tickets)
        for (j, n) in enumerate(nearby_ticket)
            for (l, v) in enumerate(restrictions)
                for r in v
                    if n in r
                        push!(A[i,j], l)
                    end
                end
            end
        end
    end

    candidates = Array{Array{Int,1},1}(undef, size(A)[2])
    for j = 1:size(A)[2]
        candidates[j] = intersect(A[:,j]...)
    end


    while length(findall(c->length(c)>1, candidates)) != 0
        oneinds = findall(c->length(c)==1, candidates)
        for oi in oneinds
            val = candidates[oi][1]
            for i = 1:length(candidates)
                i == oi && continue
                filter!(c->c!=val, candidates[i])
            end
        end
    end

    part2 = 1
    for (i, sol) in enumerate(candidates)
        if startswith(names[sol...], "departure")
            part2 *= ticket[i]
        end
    end

    return [part1, part2]
end

end  # module
