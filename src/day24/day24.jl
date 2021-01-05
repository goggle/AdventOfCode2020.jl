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
    p1 = count(values(d))

    for day = 1:100
        d2 = Dict{Array{Int,1},Bool}()
        for (k, v) in d
            neighbours = neighbour_coordinates(k)
            for coord in [k, neighbours...]
                n2 = neighbour_coordinates(coord)
                col = get(d, coord, false)
                c = count(get(d, n, false) for n in n2)
                if col  # black
                    if !(c == 0 || c > 2)
                        d2[coord] = true
                    end
                else  # white
                    if c == 2
                        d2[coord] = true
                    end
                end
            end
        end
        d = d2
    end
    p2 = count(values(d))
    return p1, p2
end

function neighbour_coordinates(source::Array{Int,1})
    return [
        source + [1, -1, 0],
        source + [0, -1, 1],
        source + [-1, 0, 1],
        source + [-1, 1, 0],
        source + [0, 1, -1],
        source + [1, 0, -1]
    ]
end

end  # module
