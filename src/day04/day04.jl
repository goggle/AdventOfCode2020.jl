module Day04

using AdventOfCode2020

function day04(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    data = parse_input(input)
    return [part1(data), part2(data)]
end

function parse_input(input::String)
    data = []
    d = Dict{String,String}()
    for line in split(input, '\n')
        if isempty(line)
            push!(data, d)
            d = Dict{String,String}()
            continue
        end
        for elem in split(line)
            k, v = split(elem, ':')
            d[k] = v
        end
    end
    return data
end

function part1(data)
    required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    nvalid = 0
    for elem in data
        invalid = false
        for rf in required_fields
            if !haskey(elem, rf)
                invalid = true
                break
            end
        end
        !invalid ? nvalid += 1 : nothing
    end
    return nvalid
end

function part2(data)
    required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    nvalid = 0
    for elem in data
        (!haskey(elem, "byr") || !(1920 <= parse(Int, elem["byr"]) <= 2002)) && continue
        (!haskey(elem, "iyr") || !(2010 <= parse(Int, elem["iyr"]) <= 2020)) && continue
        (!haskey(elem, "eyr") || !(2020 <= parse(Int, elem["eyr"]) <= 2030)) && continue
        (!haskey(elem, "hgt") || !occursin(r"^\d+cm|in$", elem["hgt"])) && continue
        m = match(r"(\d+)(cm|in)", elem["hgt"])
        m[2] == "cm" && !(150 <= parse(Int, m[1]) <= 193) && continue
        m[2] == "in" && !(59 <= parse(Int, m[1]) <= 76) && continue
        (!haskey(elem, "hcl") || !occursin(r"^#[0-9a-f]{6}$", elem["hcl"])) && continue
        (!haskey(elem, "ecl") || !occursin(r"^amb|blu|brn|gry|grn|hzl|oth$", elem["ecl"])) && continue
        (!haskey(elem, "pid") || !occursin(r"^\d{9}$", elem["pid"])) && continue
        nvalid += 1
    end
    return nvalid
end

end # module
