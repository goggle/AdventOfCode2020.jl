module Day18

using AdventOfCode2020

function day18(input::String = readInput(joinpath(@__DIR__, "input.txt")))
    sinput = split(rstrip(input), "\n")
    tokens = tokenize.(sinput)
    return [evaluate.(tokens) |> sum, evaluate.(tokens; plusfirst = true) |> sum]
end

function tokenize(inp::AbstractString)
    tokens = Array{Union{Char,Int},1}()
    i = 1
    while i <= length(inp)
        if isdigit(inp[i])
            m = match(r"(\d+)", inp[i:end])
            push!(tokens, parse(Int, m[1]))
            i += length(m[1])
            continue
        elseif inp[i] in ('+', '*', '(', ')')
            push!(tokens, inp[i])
        end
        i+= 1
    end
    return tokens
end


Base.isinteger(::Char) = false
function evaluate(token::Array{Union{Char,Int},1}; plusfirst = false)
    stack = []
    levels = Array{Int,1}()

    level = 0
    for t in token
        if isinteger(t)
            push!(stack, t)
            push!(levels, level)
        elseif t == '+'
            push!(stack, +)
            push!(levels, level)
        elseif t == '*'
            push!(stack, *)
            push!(levels, level)
        elseif t == '('
            level += 1
        elseif t == ')'
            level -= 1
        end
    end
    return evalstack!(stack, levels; plusfirst = plusfirst)
end

function evalstack!(stack::Array{Any,1}, levels::Array{Int,1}; plusfirst = false)
    M = maximum(levels)
    M == 0 && return evalstack!(stack; plusfirst = plusfirst)
    ns = []
    nl = Array{Int,1}()
    i = j = 1
    while i <= length(stack)
        if levels[i] < M
            push!(ns, stack[i])
            push!(nl, levels[i])
            i += 1
        else
            j = i
            while j <= length(stack) && levels[j] == M
                j += 1
            end
            res = evalstack!(stack[i:j-1]; plusfirst = plusfirst)
            push!(ns, res)
            push!(nl, M - 1)
            i = j
        end
    end
    return evalstack!(ns, nl; plusfirst = plusfirst)
end

function evalstack!(stack::Array{Any,1}; plusfirst = false)
    isempty(stack) && return

    if plusfirst
        tmpstack = []
        push!(tmpstack, popfirst!(stack))
        while !isempty(stack)
            n1 = pop!(tmpstack)
            op = popfirst!(stack)
            n2 = popfirst!(stack)
            if op == +
                push!(tmpstack, op(n1, n2))
            else
                push!(tmpstack, n1, op, n2)
            end
        end
        stack = tmpstack
    end

    s = popfirst!(stack)
    while !isempty(stack)
        op = popfirst!(stack)
        s = op(s, popfirst!(stack))
    end
    return s
end

end  # module
