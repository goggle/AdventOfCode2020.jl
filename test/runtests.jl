using AdventOfCode2020
using Test

@testset "Day 1" begin
    sample = [1721, 979, 366, 299, 675, 1456]
    @test AdventOfCode2020.Day01.part1(sample) == 514579
    @test AdventOfCode2020.Day01.part2(sample) == 241861950
    @test AdventOfCode2020.Day01.day01() == [1007104, 18847752]
end
