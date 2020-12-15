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

@testset "Day 3" begin
    sample = "..##.......\n" *
             "#...#...#..\n" *
             ".#....#..#.\n" *
             "..#.#...#.#\n" *
             ".#...##..#.\n" *
             "..#.##.....\n" *
             ".#.#.#....#\n" *
             ".#........#\n" *
             "#.##...#...\n" *
             "#...##....#\n" *
             ".#..#...#.#\n"
    streemap = AdventOfCode2020.Day03.parse_input(sample)
    @test AdventOfCode2020.Day03.part1(streemap) == 7
    @test AdventOfCode2020.Day03.part2(streemap) == 336
    @test AdventOfCode2020.Day03.day03() == [148, 727923200]
end

@testset "Day 4" begin
    sample1 = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\n" *
              "byr:1937 iyr:2017 cid:147 hgt:183cm\n" *
              "\n" *
              "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\n" *
              "hcl:#cfa07d byr:1929\n" *
              "\n" *
              "hcl:#ae17e1 iyr:2013\n" *
              "eyr:2024\n" *
              "ecl:brn pid:760753108 byr:1931\n" *
              "hgt:179cm\n" *
              "\n" *
              "hcl:#cfa07d eyr:2025 pid:166559648\n" *
              "iyr:2011 ecl:brn hgt:59in\n"
    data1 = AdventOfCode2020.Day04.parse_input(sample1)
    @test AdventOfCode2020.Day04.part1(data1) == 2

    sample2 = "eyr:1972 cid:100\n" *
              "hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926\n" *
              "\n" *
              "iyr:2019\n" *
              "hcl:#602927 eyr:1967 hgt:170cm\n" *
              "ecl:grn pid:012533040 byr:1946\n" *
              "\n" *
              "hcl:dab227 iyr:2012\n" *
              "ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277\n" *
              "\n" *
              "hgt:59cm ecl:zzz\n" *
              "eyr:2038 hcl:74454a iyr:2023\n" *
              "pid:3556412378 byr:2007\n"
    data2 = AdventOfCode2020.Day04.parse_input(sample2)
    @test AdventOfCode2020.Day04.part2(data2) == 0

    sample3 = "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\n" *
              "hcl:#623a2f\n" *
              "\n" *
              "eyr:2029 ecl:blu cid:129 byr:1989\n" *
              "iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm\n" *
              "\n" *
              "hcl:#888785\n" *
              "hgt:164cm byr:2001 iyr:2015 cid:88\n" *
              "pid:545766238 ecl:hzl\n" *
              "eyr:2022\n" *
              "\n" *
              "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719\n"
    data3 = AdventOfCode2020.Day04.parse_input(sample3)
    @test AdventOfCode2020.Day04.part2(data3) == 4

    @test AdventOfCode2020.Day04.day04() == [202, 137]
end

@testset "Day 5" begin
    @test AdventOfCode2020.Day05.get_seat_id("FBFBBFFRLR") == 357
    @test AdventOfCode2020.Day05.get_seat_id("BFFFBBFRRR") == 567
    @test AdventOfCode2020.Day05.get_seat_id("FFFBBBFRRR") == 119
    @test AdventOfCode2020.Day05.get_seat_id("BBFFBBFRLL") == 820
    @test AdventOfCode2020.Day05.day05() == [806, 562]
end

@testset "Day 6" begin
    sample = "abc\n" *
             "\n" *
             "a\n" *
             "b\n" *
             "c\n" *
             "\n" *
             "ab\n" *
             "ac\n" *
             "\n" *
             "a\n" *
             "a\n" *
             "a\n" *
             "a\n" *
             "\n" *
             "b\n"
    @test AdventOfCode2020.Day06.day06(sample) == [11, 6]
    @test AdventOfCode2020.Day06.day06() == [6775, 3356]
end

@testset "Day 7" begin
    sample = "light red bags contain 1 bright white bag, 2 muted yellow bags.\n" *
             "dark orange bags contain 3 bright white bags, 4 muted yellow bags.\n" *
             "bright white bags contain 1 shiny gold bag.\n" *
             "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\n" *
             "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.\n" *
             "dark olive bags contain 3 faded blue bags, 4 dotted black bags.\n" *
             "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.\n" *
             "faded blue bags contain no other bags.\n" *
             "dotted black bags contain no other bags.\n"
    @test AdventOfCode2020.Day07.day07(sample) == [4, 32]

    sample2 = "shiny gold bags contain 2 dark red bags.\n" *
              "dark red bags contain 2 dark orange bags.\n" *
              "dark orange bags contain 2 dark yellow bags.\n" *
              "dark yellow bags contain 2 dark green bags.\n" *
              "dark green bags contain 2 dark blue bags.\n" *
              "dark blue bags contain 2 dark violet bags.\n" *
              "dark violet bags contain no other bags.\n"
    @test AdventOfCode2020.Day07.day07(sample2)[2] == 126

    @test AdventOfCode2020.Day07.day07() == [177, 34988]
end

@testset "Day 8" begin
    sample = "nop +0\n" *
             "acc +1\n" *
             "jmp +4\n" *
             "acc +3\n" *
             "jmp -3\n" *
             "acc -99\n" *
             "acc +1\n" *
             "jmp -4\n" *
             "acc +6\n"
    @test AdventOfCode2020.Day08.day08(sample) == [5, 8]

    @test AdventOfCode2020.Day08.day08() == [1816, 1149]
end

@testset "Day 9" begin
    sample = "35\n" *
             "20\n" *
             "15\n" *
             "25\n" *
             "47\n" *
             "40\n" *
             "62\n" *
             "55\n" *
             "65\n" *
             "95\n" *
             "102\n" *
             "117\n" *
             "150\n" *
             "182\n" *
             "127\n" *
             "219\n" *
             "299\n" *
             "277\n" *
             "309\n" *
             "576\n"
    numbers = parse.(Int, split(strip(sample), "\n"))
    @test AdventOfCode2020.Day09.part1(numbers, 5) == 127
    @test AdventOfCode2020.Day09.part2(numbers, 127) == 62

    @test AdventOfCode2020.Day09.day09() == [731031916, 93396727]
end

@testset "Day 10" begin
    sample1 = "16\n" *
             "10\n" *
             "15\n" *
             "5\n" *
             "1\n" *
             "11\n" *
             "7\n" *
             "19\n" *
             "6\n" *
             "12\n" *
             "4\n"
    @test AdventOfCode2020.Day10.day10(sample1) == [35, 8]

    sample2 = "28\n" *
              "33\n" *
              "18\n" *
              "42\n" *
              "31\n" *
              "14\n" *
              "46\n" *
              "20\n" *
              "48\n" *
              "47\n" *
              "24\n" *
              "23\n" *
              "49\n" *
              "45\n" *
              "19\n" *
              "38\n" *
              "39\n" *
              "11\n" *
              "1\n" *
              "32\n" *
              "25\n" *
              "35\n" *
              "8\n" *
              "17\n" *
              "7\n" *
              "9\n" *
              "4\n" *
              "2\n" *
              "34\n" *
              "10\n" *
              "3\n"
    @test AdventOfCode2020.Day10.day10(sample2) == [220, 19208]

    @test AdventOfCode2020.Day10.day10() == [2432, 453551299002368]
end

@testset "Day 11" begin
    sample = "L.LL.LL.LL\n" *
             "LLLLLLL.LL\n" *
             "L.L.L..L..\n" *
             "LLLL.LL.LL\n" *
             "L.LL.LL.LL\n" *
             "L.LLLLL.LL\n" *
             "..L.L.....\n" *
             "LLLLLLLLLL\n" *
             "L.LLLLLL.L\n" *
             "L.LLLLL.LL\n"
    @test AdventOfCode2020.Day11.day11(sample) == [37, 26]

    sample2 = ".......#.\n" *
              "...#.....\n" *
              ".#.......\n" *
              ".........\n" *
              "..#L....#\n" *
              "....#....\n" *
              ".........\n" *
              "#........\n" *
              "...#.....\n"
    seats2 = reduce(vcat, permutedims.(collect.(split(sample2))))
    @test AdventOfCode2020.Day11.count_seats_part2(seats2, 5, 4, '#') == 8

    sample3 = ".............\n" *
              ".L.L.#.#.#.#.\n" *
              ".............\n"
    seats3 = reduce(vcat, permutedims.(collect.(split(sample3))))
    @test AdventOfCode2020.Day11.count_seats_part2(seats3, 2, 2, 'L') == 1
    @test AdventOfCode2020.Day11.count_seats_part2(seats3, 2, 2, '#') == 0

    sample4 = ".##.##.\n" *
              "#.#.#.#\n" *
              "##...##\n" *
              "...L...\n" *
              "##...##\n" *
              "#.#.#.#\n" *
              ".##.##.\n"
    seats4 = reduce(vcat, permutedims.(collect.(split(sample4))))
    @test AdventOfCode2020.Day11.count_seats_part2(seats4, 4, 4, '#') == 0

    @test AdventOfCode2020.Day11.day11() == [2113, 1865]
end

@testset "Day 12" begin
    sample = "F10\n" *
             "N3\n" *
             "F7\n" *
             "R90\n" *
             "F11\n"
    @test AdventOfCode2020.Day12.day12(sample)[1] == 25
    @test AdventOfCode2020.Day12.day12(sample)[2] == 286

    @test AdventOfCode2020.Day12.day12() == [1441, 61616]
end

@testset "Day 13" begin
    sample = "939\n7,13,x,x,59,x,31,19\n"
    @test AdventOfCode2020.Day13.day13(sample)[1] == 295
    @test AdventOfCode2020.Day13.day13(sample)[2] == 1068781

    @test AdventOfCode2020.Day13.day13("111\n17,x,13,19\n")[2] == 3417
    @test AdventOfCode2020.Day13.day13("111\n67,7,59,61\n")[2] == 754018
    @test AdventOfCode2020.Day13.day13("111\n67,x,7,59,61\n")[2] == 779210
    @test AdventOfCode2020.Day13.day13("111\n67,7,x,59,61\n")[2] == 1261476
    @test AdventOfCode2020.Day13.day13("111\n1789,37,47,1889\n")[2] == 1202161486

    @test AdventOfCode2020.Day13.day13() == [8063, 775230782877242]
end

@testset "Day 14" begin
    sample = "mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X\n" *
             "mem[8] = 11\n" *
             "mem[7] = 101\n" *
             "mem[8] = 0\n"
    @test AdventOfCode2020.Day14.solve(sample, AdventOfCode2020.Day14.write_to_memory_part1!) == 165

    sample2 = "mask = 000000000000000000000000000000X1001X\n" *
              "mem[42] = 100\n" *
              "mask = 00000000000000000000000000000000X0XX\n" *
              "mem[26] = 1\n"
    @test AdventOfCode2020.Day14.solve(sample2, AdventOfCode2020.Day14.write_to_memory_part2!) == 208

    @test AdventOfCode2020.Day14.day14() == [6386593869035, 4288986482164]
end
