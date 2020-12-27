module Day20

# import Base.rot180
using AdventOfCode2020


function day20(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    names, tiles, borders = parse_input(input)
    result = Result(convert(Int, sqrt(length(names))))
    possible_borders = [[op(b) for op in AdventOfCode2020.Day20.generate_ops()] for b in borders]
    solve3!(result, 1, collect(1:length(names)), names, tiles, possible_borders)
    p1 = names[result.img[1,1]] * names[result.img[1,end]] * names[result.img[end,1]] * names[result.img[end,end]]
    return [p1, part2(result)]
end


struct Result
    n::Int
    img::Array{Int,2}
    ops::Array{Any,2}
    borders::Array{Array{Int,1},2}
    tiles::Array{BitArray{2},2}
end
Result(n::Int) = Result(n, zeros(Int, n, n), zeros(Int, n, n), fill(zeros(Int, 4), n, n), fill(BitArray(zeros(Int, 10, 10)), n, n))
Base.length(res::Result) = res.n * res.n

function check_tile(result::Result, border, i, j)
    if i != 1
        border[1] == result.borders[i-1,j][3] || return false
    end
    if j != 1
        border[4] == result.borders[i,j-1][2] || return false
    end
    return true
end

function check_tile(result::Result, border, l)
    i, j = CartesianIndices(result.img)[l].I
    if i != 1
        # border[1] == result.borders[i-1,j][3] || return false
        if border[1] != result.borders[i-1,j][3]
            return false
        end
    end
    if j != 1
       # border[4] == result.borders[i,j-1][2] || return false
       if border[4] != result.borders[i,j-1][2]
           return false
       end
    end
    return true
end

function check_tile2(result::Result, tile, l)
    i, j = CartesianIndices(result.img)[l].I
    if i != 1
        if tile[1,:] != result.tiles[i-1,j][end,:]
            return false
        end
    end
    if j != 1
        if tile[:,1] != result.tiles[i,j-1][:,end]
            return false
        end
    end
    return true
end

function parse_input(input::String)
    names = Array{Int,1}()
    tiles = Array{BitArray{2},1}()
    borders = Array{Array{Int,1},1}()
    for tile in split(rstrip(input), "\n\n")
        lines = split(tile, "\n")
        m = match(r"Tile\s+(\d+)", lines[1])
        push!(names, parse(Int, m[1]))
        tl = parse.(Bool, reduce(vcat, permutedims.(replace.(replace.(split.(lines[2:end], ""), "." => "0"), "#" => "1"))))
        push!(tiles, tl)

        # orientation: north, east, south, west
        border = [
            tl[1,:] .* (2^i for i=9:-1:0) |> sum,
            tl[:,end] .* (2^i for i=9:-1:0) |> sum,
            tl[end,:] .* (2^i for i=9:-1:0) |> sum,
            tl[:,1] .* (2^i for i=9:-1:0) |> sum,
        ]
        push!(borders, border)
    end
    return names, tiles, borders
end


rev(n::Int) = digits(n, base = 2, pad = 10) .* (2^i for i = 9:-1:0) |> sum
rot90(a::Array{Int,1}) = [rev(a[4]), a[1], rev(a[2]), a[3]]
rot90(a::BitArray{2}) = rotr90(a)
rot180n(a::Array{Int,1}) = [rev(a[3]), rev(a[4]), rev(a[1]), rev(a[2])]
rot180n(a::BitArray{2}) = rot180(a)
rot270(a::Array{Int,1}) = [a[2], rev(a[3]), a[4], rev(a[1])]
rot270(a::BitArray{2}) = rotl90(a)

flipv(a::Array{Int,1}) = [a[3], rev(a[2]), a[1], rev(a[4])]
flipv(a::BitArray{2}) = reverse(a, dims = 1)

function generate_ops()
    return (r ∘ f for f in [identity, flipv] for r in [identity, rot90, rot180n, rot270])
end

function solve!(result::Result, curr::Int, available::Array{Int,1}, names::Array{Int,1}, tiles::Array{BitArray{2},1}, borders::Array{Array{Int,1},1})#, debug)
    if curr > length(result)
        return true
    end
    for a in available
        b = borders[a]
        for (i, op) in enumerate(generate_ops())
            nb = op(b)
            if check_tile(result, nb, curr)
                result.img[curr] = a
                result.ops[curr] = i
                result.tiles[curr] = op(tiles[a])
                result.borders[curr] = nb
                suc = solve!(result, curr + 1, filter(x->x!=a, available), names, tiles, borders)#, debug)
                if suc
                    return true
                end
            end
        end
    end
    return false
end

function get_op(i::Int)
    i == 1 && return identity
    i == 2 && return rot90
    i == 3 && return rot180n
    i == 4 && return rot270
    i == 5 && return flipv
    i == 6 && return rot90 ∘ flipv
    i == 7 && return rot180n ∘ flipv
    i == 8 && return rot270 ∘ flipv
end

function solve3!(result::Result, curr::Int, available::Array{Int,1}, names::Array{Int,1}, tiles::Array{BitArray{2},1}, borders::Array{Array{Array{Int,1},1},1})
    curr > length(result) && return true
    for a in available
        bords = borders[a]
        for (i, b) in enumerate(bords)
            if check_tile(result, b, curr)
                result.img[curr] = a
                result.ops[curr] = i
                result.tiles[curr] = get_op(i)(tiles[a])
                result.borders[curr] = b
                suc = solve3!(result, curr + 1, filter(x -> x != a, available), names, tiles, borders)
                suc && return true
            end
        end
    end
    return false
end

function solve2!(result::Result, curr::Int, available::Array{Int,1}, names::Array{Int,1}, tiles::Array{BitArray{2},1})
    if curr > length(result)
        return true
    end
    for a in available
        tile = tiles[a]
        rftiles = [
            tile,
            rotr90(tile),
            rot180(tile),
            rotl90(tile),
            reverse(tile, dims=1),
            rotr90(reverse(tile, dims=1)),
            rot180(reverse(tile, dims=1)),
            rotl90(reverse(tile, dims=1))
        ]
        for (i, t) in enumerate(rftiles)
            if check_tile2(result, t, curr)
                result.ops[curr] = i
                result.img[curr] = a
                result.tiles[curr] = t
                suc = solve2!(result, curr + 1, filter(x->x!=a, available), names, tiles)
                if suc
                    return true
                end
            end
        end
    end
    return false
end

function construct_image(result::Result)
    l = length(result.tiles[1][1,:]) - 2
    image = BitArray(undef, result.n*l, result.n*l)
    for i = 1:result.n
        for j = 1:result.n
            image[1+(i-1)*l:i*l, 1+(j-1)*l:j*l] = result.tiles[i,j][2:end-1,2:end-1]
        end
    end
    return image
end

function part2(result::Result)
    image = construct_image(result)
    m, n = size(image)
    monsters = "                  # \n" *
               "#    ##    ##    ###\n" *
               " #  #  #  #  #  #   "
    origmonster = parse.(Bool, reduce(vcat, permutedims.(replace.(replace.(split.(split(monsters, "\n"), ""), " " => "0"), "#" => "1"))))
    nhashtags = count(origmonster)
    mcount = BitArray(zeros(Bool, m, n))
    for op in generate_ops()
        monster = op(origmonster)
        mm, nm = size(monster)
        for i = 1:m-mm+1
            for j = 1:n-nm+1
                ma = (image[i:i+mm-1, j:j+nm-1] .== monster .== 1)
                if count(ma) == nhashtags  # monster found
                    for k = i:i+mm-1
                        for l = j:j+nm-1
                            if image[k,l] == true && monster[k-i+1, l-j+1]
                                mcount[k,l] = true
                            end
                        end
                    end
                end
            end
        end
    end
    return count(image) - count(mcount)
end

end  # module
