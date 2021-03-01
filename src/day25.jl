module Day25

using AdventOfCode2020

function day25(input::String = readInput(joinpath(@__DIR__, "..", "data", "day25.txt")))
    public = parse.(Int, split(input))
    loopsizes = loopsize.(public)
    l = argmin(loopsizes)
    j = mod1(l + 1, 2)
    return encryption_key(public[j], loopsizes[l])
end

function loopsize(number::Int)
    loopsize = 1
    subject = 7
    value = 1
    while true
        value *= subject
        value == number && return loopsize
        value %= 20201227
        value == number && return loopsize
        loopsize += 1
    end
end

function encryption_key(subject::Int, loop::Int)
    value = 1
    for i = 1:loop
        value *= subject
        value %= 20201227
    end
    return value
end

end  # module
