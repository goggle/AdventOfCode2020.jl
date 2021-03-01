module Day13

using AdventOfCode2020

function day13(input::String = readInput(joinpath(@__DIR__, "..", "data", "day13.txt")))
    timestamp = parse(Int, split(input)[1])
    ids = [parse(Int, x) for x in split(split(input)[2], ',') if x != "x"]
    pos = findall(x->x!=nothing, tryparse.(Int, split(split(input)[2], ","))) .- 1
    return [part1(timestamp, ids), part2(ids, pos)]
end

function part1(timestamp::Int, ids::Array{Int,1})
    waiting_times = ids - timestamp .% ids
    imin = argmin(waiting_times)
    return ids[imin] * waiting_times[imin]
end

function part2(ids::Array{Int,1}, pos::Array{Int,1})
    # Use the Chinese Remainder Theorem:
    P = convert(Int128, prod(ids))
    return mod(sum(ai * invmod(P ÷ ni, ni) * P ÷ ni for (ni, ai) in zip(ids, -pos)), P)
end

end  # module
