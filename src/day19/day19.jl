module Day19

using AdventOfCode2020

function day19(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    dinit, words = parse_input(input)

    d = replace_numbers(dinit)
    p1 = 0
    rule0 = Regex("^" * d[0] * "\$")
    for word in words
        if match(rule0, word) != nothing
            p1 += 1
        end
    end

    dinit[8] = " 42 | 42 8 "
    dinit[11] = " 42 31 | 42 11 31 "
    d = replace_numbers(dinit)
    # return d
    p2 = 0
    rule0 = Regex("^" * d[0] * "\$")
    for word in words
        if match(rule0, word) != nothing
            p2 += 2
        end
    end
    return [p1, p2]
end

function parse_input(input::String)
    sinput = split(input, "\n\n")
    p1 = sinput[1]
    d = Dict{Int,String}()
    for line in split(p1, "\n")
        sline = split(line, ":")
        key = parse(Int, sline[1])
        d[key] = replace(sline[2] * " ", "\"" => "")
    end
    words = split(rstrip(sinput[2]), "\n")

    return d, words
end

function replace_numbers(d)
    # i = 0
    n = count(contains.(values(d), r"\d+"))
    m = 0
    while n != m
        rl = filter(p->!contains(p.second, r"\d+"), d)
        for (k, nv) in rl
            for (k2, v2) in d
                k2 == 0 && continue
                numbstr = string(k)
                d[k2] = replace(d[k2], " " * numbstr * " " => " ( " * nv * " ) ")
            end
        end
        m = n
        n = count(contains.(values(d), r"\d+"))
    end

    for i = 1:20
    #     println("YES")
    #     c = copy(d)
        for (k, nv) in d
            for k2 in (8, 11)
                numbstr = string(k)
                d[k2] = replace(d[k2], " " * numbstr * " " => " ( " * nv * " ) ")
            end
        end
    end
    # c = copy(d)
    for (k, nv) in d
        numbstr = string(k)
        d[0] = replace(d[0], " " * numbstr * " " => " ( " * nv * " ) ")
    end

    for (k, v) in d
        d[k] = replace(d[k], r"\s*" => "")
    end
    return d
end

end  # module
