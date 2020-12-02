# AdventOfCode2020.jl

This Julia package contains my solutions for [Advent of Code 2020](https://adventofcode.com/2020/).

## Overview

| Day | Problem | Time | Allocated memory | Source |
|----:|:-------:|-----:|-----------------:|:------:|
| 1 | [:white_check_mark:](https://adventofcode.com/2020/day/1) | 35.712 μs | 17.25 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day01/day01.jl) |
| 2 | [:white_check_mark:](https://adventofcode.com/2020/day/2) | 520.969 μs | 454.77 KiB | [:white_check_mark:](https://github.com/goggle/AdventOfCode2020.jl/blob/master/src/day02/day02.jl) |

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
