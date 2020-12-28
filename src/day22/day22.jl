module Day22

using AdventOfCode2020

function day22(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    cards = parse_input(input)
    p1 = part1!(deepcopy(cards))
    p2 = part2!(deepcopy(cards), 1)
    return [p1, p2]
end

function parse_input(input::String)
    cards = Array{Array{Int,1},1}()
    for (i, playerline) in enumerate(split(input, "\n\n"))
        push!(cards, [])
        for line in split(rstrip(playerline), "\n")[2:end]
            push!(cards[i], parse(Int, line))
        end
    end
    return cards
end

function part1!(cards::Array{Array{Int,1},1})
    while !isempty(cards[1]) && !isempty(cards[2])
        cp1 = popfirst!(cards[1])
        cp2 = popfirst!(cards[2])
        if cp1 > cp2
            push!(cards[1], cp1, cp2)
        else
            push!(cards[2], cp2, cp1)
        end
    end
    for i = 1:2
        j = mod1(i + 1, 2)
        isempty(cards[i]) && return cards[j] .* (length(cards[j]):-1:1) |> sum
    end
end

function part2!(cards::Array{Array{Int,1},1}, level::Int)
    state1, state2 = Set{Array{Int,1}}(), Set{Array{Int,1}}()
    while true
        (cards[1] in state1 || cards[2] in state2) && return 1
        push!(state1, copy(cards[1]))
        push!(state2, copy(cards[2]))

        cp1 = popfirst!(cards[1])
        cp2 = popfirst!(cards[2])
        if all(length.(cards) .>= (cp1, cp2))
            rw = part2!([deepcopy(cards[1][1:cp1]), deepcopy(cards[2][1:cp2])], level + 1)
        else
            if cp1 > cp2
                rw = 1
            else
                rw = 2
            end
        end
        if rw == 1
            push!(cards[1], cp1, cp2)
        elseif rw == 2
            push!(cards[2], cp2, cp1)
        end
        if any(isempty.(cards))
            for i = 1:2
                j = mod1(i + 1, 2)
                isempty(cards[i]) && level == 1 && return cards[j] .* (length(cards[j]):-1:1) |> sum
                isempty(cards[i]) && return j
            end
        end
    end
end

end  # module
