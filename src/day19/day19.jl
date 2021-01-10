module Day19

using AdventOfCode2020

function day19(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    rules, charrules, words = parse_input(input)
    rule = Array{Int,1}()
    for r in rules[0][1]
        push!(rule, r)
    end
    crule = deepcopy(rule)

    p1 = count(check!(rule, rules, charrules, word) for word in words)

    rules[8] = [[42], [42, 8]]
    rules[11] = [[42, 31], [42, 11, 31]]
    p2 = count(check!(crule, rules, charrules, word) for word in words)

    return [p1, p2]
end

function check!(rule::Array{Int,1}, rules::Dict{Int,Array{Array{Int,1},1}}, charrules::Dict{Int,Char}, word::AbstractString)
    rev = Dict(value => key for (key, value) in charrules)
    word = [rev[c] for c in word]
    return check_rec!(rule, rules, Set(keys(charrules)), word)
end

function check_rec!(rule::Array{Int,1}, rules::Dict{Int,Array{Array{Int,1},1}}, charints::Set{Int}, word::Array{Int,1})
    length(rule) > length(word) && return false
    rule == word && return true

    i = 0
    while i + 1 < length(rule) && rule[i + 1] ∈ charints
        i += 1
    end
    i >= 1 && rule[1:i] != word[1:i] && return false

    if i >= 1
        rule = rule[i+1:end]
        word = word[i+1:end]
    end

    newrules = Array{Array{Int,1},1}()
    for (i, r) in enumerate(rule)
        for repl in rules[r]
            push!(newrules, [rule[1:i-1]..., repl..., rule[i+1:end]...])
        end
        for newrule in newrules
            check_rec!(newrule, rules, charints, word) && return true
        end
        return false
    end
end

function parse_input(input::String)
    sinput = split(input, "\n\n")
    p1 = sinput[1]
    rules = Dict{Int,Array{Array{Int,1},1}}()
    charrules = Dict{Int,Char}()
    for line in split(p1, "\n")
        sline = split(line, ":")
        key = parse(Int, sline[1])
        rulestr = replace(sline[2] * " ", "\"" => "")
        srulestr = split(strip(rulestr), "|")
        rules[key] = Array{Array{Int,1},1}()
        for rule in srulestr
            numbers = split(strip(rule), " ")
            add = tryparse.(Int, numbers)
            if nothing ∉ add
                push!(rules[key], add)
            else
                charrules[key] = strip(rule)[1]
            end
        end
    end
    words = split(rstrip(sinput[2]), "\n")
    return rules, charrules, words
end

end  # module
