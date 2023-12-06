# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class WaitForIt < Day
    INPUT = <<~EOINPUT
      Time:        61     67     75     71
      Distance:   430   1036   1307   1150
    EOINPUT

    def setup(input = INPUT.chomp)
      lines = input.split("\n")
      @races = parse_line(lines[0]).zip(parse_line(lines[1]))
    end

    def part1
      @races.reduce(1) do |acc, (time, distance)|
        error_margin(time, distance) * acc
      end
    end

    def error_margin(time, distance)
      distance += 1 # Need to beat the previous record!

      (
        ((time + Math.sqrt((time**2) - (distance * 4))) / 2).floor -
        ((time - Math.sqrt((time**2) - (distance * 4))) / 2).ceil
      ) + 1
    end

    def parse_line(line)
      _, numbers = line.split(':')
      numbers.split.map(&:to_i)
    end
  end
end
