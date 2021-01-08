[![CI](https://github.com/goggle/AdventOfCode2020.jl/workflows/CI/badge.svg)](https://github.com/goggle/AdventOfCode2020.jl/actions?query=workflow%3ACI+branch%3Amaster)
[![Code coverage](https://codecov.io/gh/goggle/AdventOfCode2020.jl/branch/master/graphs/badge.svg?branch=master)](https://codecov.io/github/goggle/AdventOfCode2020.jl?branch=master)

# AdventOfCode2020.jl

This Julia package contains my solutions for [Advent of Code 2020](https://adventofcode.com/2020/).

## Overview

| Day | Problem | Time | Allocated memory | Source |
|----:|:-------:|-----:|-----------------:|:------:|
| 1 | [:white_check_mark:](https://adventofcode.com/2020/day/1) | 35.712 μs | 17.25 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day01/day01.jl) |
| 2 | [:white_check_mark:](https://adventofcode.com/2020/day/2) | 508.126 μs | 454.77 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day02/day02.jl) |
| 3 | [:white_check_mark:](https://adventofcode.com/2020/day/3) | 120.052 μs | 44.17 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day03/day03.jl) |
| 4 | [:white_check_mark:](https://adventofcode.com/2020/day/4) | 1.582 ms | 1.45 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day04/day04.jl) |
| 5 | [:white_check_mark:](https://adventofcode.com/2020/day/5) | 425.170 μs | 85.20 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day05/day05.jl) |
| 6 | [:white_check_mark:](https://adventofcode.com/2020/day/6) | 2.224 ms | 2.29 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day06/day06.jl) |
| 7 | [:white_check_mark:](https://adventofcode.com/2020/day/7) | 3.311 ms | 1.86 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day07/day07.jl) |
| 8 | [:white_check_mark:](https://adventofcode.com/2020/day/8) | 19.150 ms | 5.57 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day08/day08.jl) |
| 9 | [:white_check_mark:](https://adventofcode.com/2020/day/9) | 591.718 μs | 119.36 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day09/day09.jl) |
| 10 | [:white_check_mark:](https://adventofcode.com/2020/day/10) | 20.432 μs | 17.84 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day10/day10.jl) |
| 11 | [:white_check_mark:](https://adventofcode.com/2020/day/11) | 49.647 ms | 217.98 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day11/day11.jl) |$
| 12 | [:white_check_mark:](https://adventofcode.com/2020/day/12) | 343.275 μs | 488.27 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day12/day12.jl) |
| 13 | [:white_check_mark:](https://adventofcode.com/2020/day/13) | 32.554 μs | 35.38 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day13/day13.jl) |
| 14 | [:white_check_mark:](https://adventofcode.com/2020/day/14) | 15.288 ms | 21.10 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day14/day14.jl) |
| 15 | [:white_check_mark:](https://adventofcode.com/2020/day/15) | 373.204 ms | 114.45 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day15/day15.jl) |
| 16 | [:white_check_mark:](https://adventofcode.com/2020/day/16) | 11.049 ms | 8.50 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day16/day16.jl) |
| 17 | [:white_check_mark:](https://adventofcode.com/2020/day/17) | 48.215 ms | 439.09 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day17/day17.jl) |
| 18 | [:white_check_mark:](https://adventofcode.com/2020/day/18) | 5.157 ms | 3.91 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day18/day18.jl) |
| 19 | [:white_check_mark:](https://adventofcode.com/2020/day/19) | 1.295 s | 660.92 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day19/day19.jl) |
| 20 | [:white_check_mark:](https://adventofcode.com/2020/day/20) | 145.712 ms | 51.68 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day20/day20.jl) |
| 21 | [:white_check_mark:](https://adventofcode.com/2020/day/21) | 1.845 ms | 2.25 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day21/day21.jl) |
| 22 | [:white_check_mark:](https://adventofcode.com/2020/day/22) | 286.649 ms | 141.67 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day22/day22.jl) |
| 23 | [:white_check_mark:](https://adventofcode.com/2020/day/23) | 1.150 s | 38.15 MiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day23/day23.jl) |
| 24 | [:white_check_mark:](https://adventofcode.com/2020/day/24) | 2.434 s | 1.96 GiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day24/day24.jl) |
| 25 | [:white_check_mark:](https://adventofcode.com/2020/day/25) | 74.268 ms | 400 bytes | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day25/day25.jl) |


The benchmarks have been measured on this machine:
```
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
  CPU: Intel(R) Core(TM) i7-3770 CPU @ 3.40GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.1 (ORCJIT, ivybridge)
```


## Installation and Usage

Make sure you have [Julia 1.5 or newer](https://julialang.org/downloads/)
installed on your system.


### Installation

Start Julia and enter the package REPL by typing `]`. Create a new
environment:
```julia
(@v1.5) pkg> activate aoc
```

Install `AdventOfCode2020.jl`:
```
(aoc) pkg> add https://github.com/goggle/AdventOfCode2020.jl
```

Go back to the Julia REPL by pushing the `backspace` button.


### Usage

First, activate the package:
```julia
julia> using AdventOfCode2020
```

Each puzzle can now be run with `dayXY()`:
```julia
julia> day01()
2-element Array{Int64,1}:
  1007104
 18847752
```

This will use my personal input. If you want to use another input, provide it
to the `dayXY` method as a string. You can also use the `readInput` method
to read your input from a text file:
```julia
julia> input = readInput("/path/to/input.txt")
```
