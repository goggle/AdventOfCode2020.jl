module Day24

using AdventOfCode2020

function day24(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    lines = split(input)
    return solve(lines)
end

function solve(lines)
    # Uses cube corrdinates
    # Reference: https://www.redblobgames.com/grids/hexagons/
    tiles = Array{Array{Int,1},1}()
    for line in lines
        coordinates = [0, 0, 0]
        i = 1
        while i <= length(line)
            if line[i] == 'e'
                coordinates[1:2] += [1, -1]
            elseif line[i] == 'w'
                coordinates[1:2] += [-1, 1]
            elseif line[i] == 'n'
                i += 1
                if line[i] == 'e'
                    coordinates[1] += 1
                    coordinates[3] -= 1
                elseif line[i] == 'w'
                    coordinates[2] += 1
                    coordinates[3] -= 1
                end
            elseif line[i] == 's'
                i += 1
                if line[i] == 'e'
                    coordinates[2] -= 1
                    coordinates[3] += 1
                elseif line[i] == 'w'
                    coordinates[1] -= 1
                    coordinates[3] += 1
                end
            end
            i += 1
        end
        push!(tiles, coordinates)
    end

    d = Dict{Array{Int,1},Bool}()
    for tile in tiles
        color = get(d, tile, false)
        d[tile] = !color
    end

    black_tiles = Set{Tuple{Int,Int,Int}}()
    for (k, v) in d
        if v
            push!(black_tiles, Tuple(k))
        end
    end
    p1 = length(black_tiles)

    for day = 1:100
        remove = Set{Tuple{Int,Int,Int}}()
        add = Set{Tuple{Int,Int,Int}}()

        for tile in black_tiles
            neighbours = neighbour_coordinates(tile)
            for coord in [tile, neighbours...]
                n2 = neighbour_coordinates(coord)
                c = sum(neigh ∈ black_tiles for neigh in n2)
                if coord ∈ black_tiles  # black
                    if c == 0 || c > 2
                        push!(remove, coord)
                    end
                else  # white
                    if c == 2
                        push!(add, coord)
                    end
                end
            end
        end

        # Update black tiles:
        for coord in remove
            delete!(black_tiles, coord)
        end
        for coord in add
            push!(black_tiles, coord)
        end
    end

    return [p1, length(black_tiles)]
end

function neighbour_coordinates(source::Tuple{Int,Int,Int})
    return (
        source .+ (1, -1, 0),
        source .+ (0, -1, 1),
        source .+ (-1, 0, 1),
        source .+ (-1, 1, 0),
        source .+ (0, 1, -1),
        source .+ (1, 0, -1)
    )
end

end  # module
