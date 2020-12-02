using AdventOfCode2020
using Test

@testset "Day 1" begin
    sample = [1721, 979, 366, 299, 675, 1456]
    @test AdventOfCode2020.Day01.part1(sample) == 514579
    @test AdventOfCode2020.Day01.part2(sample) == 241861950
    @test AdventOfCode2020.Day01.day01() == [1007104, 18847752]
end

@testset "Day 2" begin
    sample = "1-3 a: abcde\n" *
             "1-3 b: cdefg\n" *
             "2-9 c: ccccccccc\n"
    @test AdventOfCode2020.Day02.day02(sample) == [2, 1]
    @test AdventOfCode2020.Day02.day02() == [393, 690]
end
