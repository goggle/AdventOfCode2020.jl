module Day17

using AdventOfCode2020
using OffsetArrays

function day17(input::String = readInput(joinpath(@__DIR__, "..", "data", "day17.txt")))
    return [part1(init3d(input)), part2(init4d(input))]
end

function init3d(input::String)
    sinput = split(input)
    m = length(sinput)
    n = length(sinput[1])
    A = OffsetArray(zeros(Bool, m + 4, n + 4, 5), -1:m+2, -1:n+2, -1:3)
    for i = 1:m
        for j = 1:n
            if sinput[i][j] == '#'
                A[i,j,1] = true
            end
        end
    end
    return A
end

function init4d(input::String)
    sinput = split(input)
    m = length(sinput)
    n = length(sinput[1])
    A = OffsetArray(zeros(Bool, m + 4, n + 4, 5, 5), -1:m+2, -1:n+2, -1:3, -1:3)
    for i = 1:m
        for j = 1:n
            if sinput[i][j] == '#'
                A[i,j,1,1] = true
            end
        end
    end
    return A
end

function part1(initial_state)
    A = initial_state
    for cycle = 1:6
        A = update3d(A)
    end
    return count(A)
end

function part2(initial_state)
    A = initial_state
    for cycle = 1:6
        A = update4d(A)
    end
    return count(A)
end

function update3d(A)
    m, n, k = size(A)
    om, on, ok = A.offsets
    B = OffsetArray(zeros(Bool, m + 2, n + 2, k + 2), om:m+om+1, on:n+on+1, ok:k+ok+1)
    @inbounds for x = om+2:m+om-1
        for y = on+2:n+on-1
            for z = ok+2:k+ok-1
                c = count(@view A[x-1:x+1,y-1:y+1,z-1:z+1]) - A[x, y, z]
                if (A[x,y,z] && c in (2,3)) || (!A[x,y,z] && c == 3)
                    B[x,y,z] = true
                end
            end
        end
    end
    return B
end

function update4d(A)
    m, n, k, l = size(A)
    om, on, ok, ol = A.offsets
    B = OffsetArray(zeros(Bool, m + 2, n + 2, k + 2, l + 2), om:m+om+1, on:n+on+1, ok:k+ok+1, ol:l+ol+1)
    @inbounds for x = om+2:m+om-1
        for y = on+2:n+on-1
            for z = ok+2:k+ok-1
                for w = ol+2:l+ol-1
                    c = count(@view A[x-1:x+1,y-1:y+1,z-1:z+1,w-1:w+1]) - A[x, y, z, w]
                    if (A[x,y,z,w] && c in (2,3)) || (!A[x,y,z,w] && c == 3)
                        B[x,y,z,w] = true
                    end
                end
            end
        end
    end
    return B
end

end  # module
