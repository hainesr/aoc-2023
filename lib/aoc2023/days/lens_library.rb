# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class LensLibrary < Day
    def setup(input = read_input_file.chomp)
      @instructions = input.split(',')
    end

    def part1
      @instructions.sum { |instr| hash(instr) }
    end

    def hash(string)
      string.each_char.reduce(0) { |acc, c| ((acc + c.ord) * 17) % 256 }
    end
  end
end
