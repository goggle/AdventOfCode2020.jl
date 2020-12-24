module Day20

using AdventOfCode2020

struct Result
    n::Int
    img::Array{Int,2}
    ops::Array{Int,2}
    borders::Array{Array{Int,1},2}
end
Result(n::Int) = Result(n, zeros(Int, n, n), zeros(Int, n, n), fill(zeros(Int, 4), n, n))
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

function day20(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    names, tiles, borders = parse_input(input)
    # println(names)
    # println(tiles)
    # return names, tiles, borders
    result = Result(convert(Int, sqrt(length(names))))
    return solve!(result, 1, collect(1:length(names)), names, borders)
    return [0, 0]
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
        # border = [Int.(tl[1,:].chunks)[1], Int.(tl[:,end].chunks)[1], Int.(tl[end,:].chunks)[1], Int.(tl[:,1].chunks)[1]]
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
rot90(a::Array{Int,1}) = [a[4], a[1:3]...]
rot180(a::Array{Int,1}) = [a[3:4]..., a[1:2]...]
rot270(a::Array{Int,1}) = [a[2:4]..., a[1]]
fliph(a::Array{Int,1}) = [rev(a[1]), a[4], rev(a[3]), a[2]]
flipv(a::Array{Int,1}) = [a[3], rev(a[2]), a[1], rev(a[4])]
flipb(a::Array{Int,1}) = [rev(a[3]), rev(a[4]), rev(a[1]), rev(a[2])]
flip(a::Array{Int,1}) = a[4:-1:1]

function generate_ops()
    # return (r ∘ f for r in [identity, rot90, rot180, rot270] for f in [identity, fliph, flipv, flipb])
    # return (r ∘ f for r in [identity, rot90, rot180, rot270] for f in [identity, fliph, flipv, fliph ∘ flipv])
    return (r ∘ f for r in [identity, rot90, rot180, rot270] for f in [identity, fliph, flipv, flip])
end

function solve!(result::Result, curr::Int, available::Array{Int,1}, names::Array{Int,1}, borders::Array{Array{Int,1},1})#, debug)
    # i2s = CartesianIndices(result.img)
    # if curr == 1
    #     println(curr)
    # end
    # println(curr)
    # println(length(available))
    # i = 1
    # if curr == 8 && result.img[7] == 9 && result.img[6] == 5 && result.img[5] == 4 && result.img[4] == 1 && result.img[3] == 7 && result.img[2] == 8 && result.img[1] == 2
    #     println("YEAH")
    #     println(available)
    #     push!(debug, deepcopy(result))
    #     # return true
    # end
    # println(curr)
    if curr > length(result)
        return true
    end
    for a in available
        b = borders[a]
        for op in generate_ops()
            nb = op(b)
            if check_tile(result, nb, curr)
                result.img[curr] = a
                # result.ops[curr] = op
                result.borders[curr] = nb
                suc = solve!(result, curr + 1, filter(x->x!=a, available), names, borders)#, debug)
                if suc
                    return true
                end
            end
        end
    end
    return false
end

# function generate_all(a::Array{Int,1})
#     l = []
#     rotations = [identity, rot90, rot180, rot270]
#     flips = [identity, fliph, flipv, flipb]
#     for r in rotations
#         for f in flips
#             push!(l, r(f(a)))
#         end
#     end
#     return l
# end

function transform(borders::Array{Int,1}, opn::Int)
    rotations = [identity, rot90, rot180, rot270]
    flips = [identity, fliph, flipv, flipb]
    f = flips[mod1(opn, 4)]
    r = rotations[(opn - 1) ÷ 4 + 1]
    return r(f(borders))
end

end  # module
