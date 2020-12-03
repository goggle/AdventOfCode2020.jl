module Day03

using AdventOfCode2020

function day03(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    treemap = parse_input(input)
    return [part1(treemap), part2(treemap)]
end

function parse_input(input::String)
    sp = split(input)
    rows = length(sp)
    cols = length(sp[1])
    mat = Matrix{Bool}(undef, rows, cols)
    for row = 1:rows
        for (col, char) = enumerate(sp[row])
            if char == '#'
                mat[row, col] = true
            else
                mat[row, col] = false
            end
        end
    end
    return mat
end

function check_slopes(treemap::Matrix{Bool}, right::Int, down::Int)
    ntrees = treemap[1,1] ? 1 : 0
    rows, cols = size(treemap)
    r, c = 1, 1
    while r != rows
        c = mod1(c + right, cols)
        r += down
        if treemap[r, c]
            ntrees += 1
        end
    end
    return ntrees
end

function part1(treemap::Matrix{Bool})
    return check_slopes(treemap, 3, 1)
end

function part2(treemap::Matrix{Bool})
    slopes = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
    result = 1
    for (right, down) in slopes
        result *= check_slopes(treemap, right, down)
    end
    return result
end

end # module
