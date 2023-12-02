# Advent of Code 2023
## Robert Haines

My attempt at doing [Advent of Code 2023](http://adventofcode.com/2023) in Ruby, with tests and all the trimmings.

![Tests](https://github.com/hainesr/aoc-2023/workflows/Tests/badge.svg)
![Linter](https://github.com/hainesr/aoc-2023/workflows/Linter/badge.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/15b8a50842703ea1f7ad/maintainability)](https://codeclimate.com/github/hainesr/aoc-2023/maintainability)

### Usage

After cloning, and changing into the `aoc-2023` directory, run:

```shell
$ gem install bundler
$ bundle install
$ rake
```

This will set everything up and run all the tests.

To run the solution for a particular day:

```shell
$ ./aoc-2023 <day>
```

Or via `rake`:

```shell
$ rake run <day>
```

You can run multiple days like this:

```shell
$ rake run <day_1> <day_2> ... <day_n>
```

### Licence

[Public Domain](http://unlicense.org).
