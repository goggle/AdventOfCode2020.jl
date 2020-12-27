module Day21

using AdventOfCode2020

function day21(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    ingredients, allergens, ingredients_by_line = parse_input(input)
    p1, p2 = solve(ingredients, allergens, ingredients_by_line)
    return [p1, p2]
end

function parse_input(input::String)
    ingredients = Dict{String,Int}()
    allergens = Dict{String,Array{Array{Int,1},1}}()
    ingredients_by_line = Array{Array{Int,1},1}()
    ic = 1
    for line in split(rstrip(input), "\n")
        p1, p2 = split(line, "(")
        ingrlist = split(p1)

        for ing in ingrlist
            if !haskey(ingredients, ing)
                ingredients[ing] = ic
                ic += 1
            end
        end
        m = match(r"contains\s+(.+)\)", p2)
        alllist = split(replace(m[1], "," => ""))
        push!(ingredients_by_line, [ingredients[ing] for ing in ingrlist])
        for all in alllist
            if !haskey(allergens, all)
                allergens[all] = []
            end
            push!(allergens[all], [ingredients[ing] for ing in ingrlist])
        end

    end
    return ingredients, allergens, ingredients_by_line
end

function solve(ingredients::Dict{String,Int}, allergens::Dict{String,Array{Array{Int,1},1}}, ingredients_by_line::Array{Array{Int,1},1})
    assignment = Dict{String,Array{Int}}()
    for (k, v) in allergens
        assignment[k] = intersect(allergens[k]...)
    end
    done = []
    d = -1
    while d != length(done)
        d = length(done)
        todo = []
        for (k, v) in assignment
            if length(v) == 1 && v[1] ∉ done && v[1] ∉ todo
                push!(todo, v[1])
            end
        end
        for i in todo
            for (k, v) in assignment
                length(v) == 1 && v[1] == i && continue
                filter!(x->x!=i, assignment[k])
            end
            push!(done, i)
        end
    end
    assigned_ingredients = union(values(assignment)...)

    assigned_ingredients_list = [k for (k, v) in ingredients if v ∈ values(assigned_ingredients)]
    vals = collect(Iterators.flatten(values(sort(assignment))))
    rev_ingredients = Dict(value => key for (key, value) in ingredients)
    p2list = [rev_ingredients[i] for i in vals]
    return [count(x->x∉assigned_ingredients, Iterators.flatten(ingredients_by_line)), join(p2list, ",")]
end

end  # module
