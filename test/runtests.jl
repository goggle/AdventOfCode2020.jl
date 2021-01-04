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

@testset "Day 15" begin
    @test AdventOfCode2020.Day15.solve(parse.(Int, split("0,3,6", ",")), 2020) == 436
    @test AdventOfCode2020.Day15.solve(parse.(Int, split("1,3,2", ",")), 2020) == 1
    @test AdventOfCode2020.Day15.solve(parse.(Int, split("2,1,3", ",")), 2020) == 10
    @test AdventOfCode2020.Day15.solve(parse.(Int, split("1,2,3", ",")), 2020) == 27
    @test AdventOfCode2020.Day15.solve(parse.(Int, split("2,3,1", ",")), 2020) == 78
    @test AdventOfCode2020.Day15.solve(parse.(Int, split("3,2,1", ",")), 2020) == 438
    @test AdventOfCode2020.Day15.solve(parse.(Int, split("3,1,2", ",")), 2020) == 1836

    @test AdventOfCode2020.Day15.day15() == [1522, 18234]
end

@testset "Day 16" begin
    sample = "class: 1-3 or 5-7\n" *
             "row: 6-11 or 33-44\n" *
             "seat: 13-40 or 45-50\n\n" *
             "your ticket:\n" *
             "7,1,14\n\n" *
             "nearby tickets:\n" *
             "7,3,47\n" *
             "40,4,50\n" *
             "55,2,20\n" *
             "38,6,12\n"
    @test AdventOfCode2020.Day16.day16(sample)[1] == 71

    @test AdventOfCode2020.Day16.day16() == [27802, 279139880759]
end

@testset "Day 17" begin
    sample = ".#.\n" *
             "..#\n" *
             "###\n"
    @test AdventOfCode2020.Day17.day17(sample) == [112, 848]

    @test AdventOfCode2020.Day17.day17() == [424, 2460]
end

@testset "Day 18" begin
    sample1 = "1 + 2 * 3 + 4 * 5 + 6"
    @test AdventOfCode2020.Day18.day18(sample1)[1] == 71
    @test AdventOfCode2020.Day18.day18(sample1)[2] == 231

    sample2 = "1 + (2 * 3) + (4 * (5 + 6))"
    @test AdventOfCode2020.Day18.day18(sample2)[1] == 51
    @test AdventOfCode2020.Day18.day18(sample2)[2] == 51

    sample3 = "2 * 3 + (4 * 5)"
    @test AdventOfCode2020.Day18.day18(sample3)[1] == 26
    @test AdventOfCode2020.Day18.day18(sample3)[2] == 46

    sample4 = "5 + (8 * 3 + 9 + 3 * 4 * 3)"
    @test AdventOfCode2020.Day18.day18(sample4)[1] == 437
    @test AdventOfCode2020.Day18.day18(sample4)[2] == 1445

    sample5 = "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))"
    @test AdventOfCode2020.Day18.day18(sample5)[1] == 12240
    @test AdventOfCode2020.Day18.day18(sample5)[2] == 669060

    sample6 = "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"
    @test AdventOfCode2020.Day18.day18(sample6)[1] == 13632
    @test AdventOfCode2020.Day18.day18(sample6)[2] == 23340

    sample7 = "9 + 7 * ((3 * 3) * 2 + 4) + 3"
    @test AdventOfCode2020.Day18.day18(sample7)[1] == 355

    @test AdventOfCode2020.Day18.day18() == [25190263477788, 297139939002972]
end

# @testset "Day 19" begin
#     sample1 = "0: 4 1 5\n" *
#              "1: 2 3 | 3 2\n" *
#              "2: 4 4 | 5 5\n" *
#              "3: 4 5 | 5 4\n" *
#              "4: \"a\"\n" *
#              "5: \"b\"\n\n" *
#              "ababbb\n" *
#              "bababa\n" *
#              "abbbab\n" *
#              "aaabbb\n" *
#              "aaaabbb\n"
#     @test AdventOfCode2020.Day19.day19(sample1)[1] == 2
#
#     sample2 = "42: 9 14 | 10 1\n" *
#               "9: 14 27 | 1 26\n" *
#               "10: 23 14 | 28 1\n" *
#               "1: \"a\"\n" *
#               "11: 42 31\n" *
#               "5: 1 14 | 15 1\n" *
#               "19: 14 1 | 14 14\n" *
#               "12: 24 14 | 19 1\n" *
#               "16: 15 1 | 14 14\n" *
#               "31: 14 17 | 1 13\n" *
#               "6: 14 14 | 1 14\n" *
#               "2: 1 24 | 14 4\n" *
#               "0: 8 11\n" *
#               "13: 14 3 | 1 12\n" *
#               "15: 1 | 14\n" *
#               "17: 14 2 | 1 7\n" *
#               "23: 25 1 | 22 14\n" *
#               "28: 16 1\n" *
#               "4: 1 1\n" *
#               "20: 14 14 | 1 15\n" *
#               "3: 5 14 | 16 1\n" *
#               "27: 1 6 | 14 18\n" *
#               "14: \"b\"\n" *
#               "21: 14 1 | 1 14\n" *
#               "25: 1 1 | 1 14\n" *
#               "22: 14 14\n" *
#               "8: 42\n" *
#               "26: 14 22 | 1 20\n" *
#               "18: 15 15\n" *
#               "7: 14 5 | 1 21\n" *
#               "24: 14 1\n\n" *
#               "abbbbbabbbaaaababbaabbbbabababbbabbbbbbabaaaa\n" *
#               "bbabbbbaabaabba\n" *
#               "babbbbaabbbbbabbbbbbaabaaabaaa\n" *
#               "aaabbbbbbaaaabaababaabababbabaaabbababababaaa\n" *
#               "bbbbbbbaaaabbbbaaabbabaaa\n" *
#               "bbbababbbbaaaaaaaabbababaaababaabab\n" *
#               "ababaaaaaabaaab\n" *
#               "ababaaaaabbbaba\n" *
#               "baabbaaaabbaaaababbaababb\n" *
#               "abbbbabbbbaaaababbbbbbaaaababb\n" *
#               "aaaaabbaabaaaaababaa\n" *
#               "aaaabbaaaabbaaa\n" *
#               "aaaabbaabbaaaaaaabbbabbbaaabbaabaaa\n" *
#               "babaaabbbaaabaababbaabababaaab\n" *
#               "aabbbbbaabbbaaaaaabbbbbababaaaaabbaaabba\n"
#     @test AdventOfCode2020.Day19.day19(sample2)[1] == 3
#     @test AdventOfCode2020.Day19.day19(sample2)[2] == 12
# end

@testset "Day 20" begin
    sample = "Tile 2311:\n" *
             "..##.#..#.\n" *
             "##..#.....\n" *
             "#...##..#.\n" *
             "####.#...#\n" *
             "##.##.###.\n" *
             "##...#.###\n" *
             ".#.#.#..##\n" *
             "..#....#..\n" *
             "###...#.#.\n" *
             "..###..###\n\n" *
             "Tile 1951:\n" *
             "#.##...##.\n" *
             "#.####...#\n" *
             ".....#..##\n" *
             "#...######\n" *
             ".##.#....#\n" *
             ".###.#####\n" *
             "###.##.##.\n" *
             ".###....#.\n" *
             "..#.#..#.#\n" *
             "#...##.#..\n\n" *
             "Tile 1171:\n" *
             "####...##.\n" *
             "#..##.#..#\n" *
             "##.#..#.#.\n" *
             ".###.####.\n" *
             "..###.####\n" *
             ".##....##.\n" *
             ".#...####.\n" *
             "#.##.####.\n" *
             "####..#...\n" *
             ".....##...\n\n" *
             "Tile 1427:\n" *
             "###.##.#..\n" *
             ".#..#.##..\n" *
             ".#.##.#..#\n" *
             "#.#.#.##.#\n" *
             "....#...##\n" *
             "...##..##.\n" *
             "...#.#####\n" *
             ".#.####.#.\n" *
             "..#..###.#\n" *
             "..##.#..#.\n\n" *
             "Tile 1489:\n" *
             "##.#.#....\n" *
             "..##...#..\n" *
             ".##..##...\n" *
             "..#...#...\n" *
             "#####...#.\n" *
             "#..#.#.#.#\n" *
             "...#.#.#..\n" *
             "##.#...##.\n" *
             "..##.##.##\n" *
             "###.##.#..\n\n" *
             "Tile 2473:\n" *
             "#....####.\n" *
             "#..#.##...\n" *
             "#.##..#...\n" *
             "######.#.#\n" *
             ".#...#.#.#\n" *
             ".#########\n" *
             ".###.#..#.\n" *
             "########.#\n" *
             "##...##.#.\n" *
             "..###.#.#.\n\n" *
             "Tile 2971:\n" *
             "..#.#....#\n" *
             "#...###...\n" *
             "#.#.###...\n" *
             "##.##..#..\n" *
             ".#####..##\n" *
             ".#..####.#\n" *
             "#..#.#..#.\n" *
             "..####.###\n" *
             "..#.#.###.\n" *
             "...#.#.#.#\n\n" *
             "Tile 2729:\n" *
             "...#.#.#.#\n" *
             "####.#....\n" *
             "..#.#.....\n" *
             "....#..#.#\n" *
             ".##..##.#.\n" *
             ".#.####...\n" *
             "####.#.#..\n" *
             "##.####...\n" *
             "##..#.##..\n" *
             "#.##...##.\n\n" *
             "Tile 3079:\n" *
             "#.#.#####.\n" *
             ".#..######\n" *
             "..#.......\n" *
             "######....\n" *
             "####.#..#.\n" *
             ".#...#.##.\n" *
             "#.#####.##\n" *
             "..#.###...\n" *
             "..#.......\n" *
             "..#.###...\n"
        @test AdventOfCode2020.Day20.day20(sample) == [20899048083289, 273]
        @test AdventOfCode2020.Day20.day20() == [63187742854073, 2152]
end

@testset "Day 21" begin
    sample = "mxmxvkd kfcds sqjhc nhms (contains dairy, fish)\n" *
             "trh fvjkl sbzzf mxmxvkd (contains dairy)\n" *
             "sqjhc fvjkl (contains soy)\n" *
             "sqjhc mxmxvkd sbzzf (contains fish)\n"
    @test AdventOfCode2020.Day21.day21(sample) == [5, "mxmxvkd,sqjhc,fvjkl"]
    @test AdventOfCode2020.Day21.day21() == [2635, "xncgqbcp,frkmp,qhqs,qnhjhn,dhsnxr,rzrktx,ntflq,lgnhmx"]
end

@testset "Day 22" begin
    sample = "Player 1:\n" *
             "9\n" *
             "2\n" *
             "6\n" *
             "3\n" *
             "1\n\n" *
             "Player 2:\n" *
             "5\n" *
             "8\n" *
             "4\n" *
             "7\n" *
             "10\n"
    @test AdventOfCode2020.Day22.day22(sample) == [306, 291]
    @test AdventOfCode2020.Day22.day22() == [32272, 33206]
end

@testset "Day 23" begin
    sample = "389125467"
    @test AdventOfCode2020.Day23.day23(sample) == [67384529, 149245887792]
    @test AdventOfCode2020.Day23.day23() == [95648732, 192515314252]
end
