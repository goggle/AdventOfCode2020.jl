module Day19

using AdventOfCode2020

function day19(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    rules, words = parse_input(input)

    rule = Array{Union{Int,Char},1}()
    for r in rules[0][1]
        push!(rule, r)
    end
    crule = deepcopy(rule)

    p1 = count(check!(rule, rules, word) for word in words)

    rules[8] = [[42], [42, 8]]
    rules[11] = [[42, 31], [42, 11, 31]]
    p2 = count(check!(crule, rules, word) for word in words)

    return [p1, p2]
end

function check!(rule::Array{Union{Int,Char},1}, rules::Dict{Int,Union{Array{Array{Int,1},1},Char}}, word::AbstractString)
    length(rule) > length(word) && return false
    all(typeof.(rule) .<: Char) && join(rule) == word && return true

    i = 0
    while i + 1 < length(rule)
        if !isinteger(rule[i + 1])
            i += 1
            continue
        end
        break
    end
    i >= 1 && join(rule[1:i]) != word[1:i] && return false

    newrules = Array{Array{Union{Int,Char},1},1}()
    for (i, r) in enumerate(rule)
        if isinteger(r)
            for repl in rules[r]
                push!(newrules, [rule[1:i-1]..., repl..., rule[i+1:end]...])
            end
            return any(check!(newrule, rules, word) for newrule in newrules)
        end
    end
    return false
end

function parse_input(input::String)
    sinput = split(input, "\n\n")
    p1 = sinput[1]
    rules = Dict{Int,Union{Array{Array{Int,1},1},Char}}()
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
                rules[key] = strip(rule)[1]
            end
        end
    end
    words = split(rstrip(sinput[2]), "\n")
    return rules, words
end

end  # module
