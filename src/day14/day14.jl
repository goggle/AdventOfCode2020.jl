module Day14

using AdventOfCode2020
using Combinatorics

function day14(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    return [solve(input, write_to_memory_part1!), solve(input, write_to_memory_part2!)]
end

function solve(input::String, func)
    memory = Dict{Int64,Int64}()
    mask = Array{Int64,1}(undef, 36)
    for line in split(rstrip(input), "\n")
        if startswith(line, r"mask\s*=")
            mstr = replace(strip(split(line, "=")[2]), "X"=>"2")
            mask = parse.(Int64, split(mstr, ""))
            continue
        elseif startswith(line, "mem")
            m = match(r"mem\[(\d+)\]\s*=\s*(\d+)", line)
            addr = parse(Int64, m[1])
            val = parse(Int64, m[2])
            func(memory, mask, addr, val)
        end
    end
    return sum(i[2] for i in memory)
end

function write_to_memory_part1!(memory::Dict{Int64,Int64},mask::Array{Int64,1}, addr::Int64, val::Int64)
    valarr = digits(val, base = 2, pad = 36) |> reverse
    valarr[findall(i->i==1, mask)] .= 1
    valarr[findall(i->i==0, mask)] .= 0
    memory[addr] = convert(Int64, BitArray(valarr |> reverse).chunks[1])
end

function write_to_memory_part2!(memory::Dict{Int64,Int64}, mask::Array{Int64,1}, addr::Int64, val::Int64)
    addarr = digits(addr, base = 2, pad = 36) |> reverse
    addarr[findall(i->i==1, mask)] .= 1
    xinds = findall(i->i==2, mask)
    addarr[xinds] .= 0
    baseaddr = convert(Int64, BitArray(addarr |> reverse).chunks[1])
    memory[baseaddr] = val
    for comb in combinations(xinds)
        memory[baseaddr + sum(2^(36 - i) for i in comb)] = val
    end
end

end  # module
