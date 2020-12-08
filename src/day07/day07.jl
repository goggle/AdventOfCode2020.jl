module Day07

using AdventOfCode2020
using SparseArrays

function day07(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    lookup = Dict{String,Int}()
    for (i, line) in enumerate(split(input, "\n"))
        line == "" && continue
        m = match(r"(.+?)\s+bags", line)
        lookup[m[1]] = i
    end
    A = spzeros(Int, length(lookup), length(lookup))
    for (i, line) in enumerate(split(input, "\n"))
        s = replace(replace(line, r"^.+?contain"=>""), r"bags?|\."=>"")
        items = strip.(split(s, ","))
        for item in items
            m = match(r"(\d+)\s+(.+)", item)
            m == nothing && continue
            amount = parse(Int, m[1])
            A[i, lookup[m[2]]] = amount
        end
    end
    return [part1(A, lookup), part2(A, lookup)]
end

function part1(A::SparseMatrixCSC{Int,Int}, lookup::Dict{String,Int})
    nz = A[:, lookup["shiny gold"]].nzind
    i = 1
    while i <= length(nz)
        for j in A[:, nz[i]].nzind
            if j ∉ nz
                push!(nz, j)
            end
        end
        i += 1
    end
    return length(nz)
end

function part2(A::SparseMatrixCSC{Int,Int}, lookup::Dict{String,Int})
    return count(A, lookup["shiny gold"])
end

function count(A::SparseMatrixCSC{Int,Int}, row)
    if length(A[row,:].nzind) == 0
        return 0
    end
    s = sum(A[row,:])
    for j in A[row,:].nzind
        s += A[row, j] * count(A, j)
    end
    return s
end

end # module
