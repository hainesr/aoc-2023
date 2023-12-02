# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class Trebuchet < Day
    DIGIT = Regexp.new('\d')

    def setup(input = read_input_file.chomp)
      @calibration_doc = input.split("\n")
    end

    def part1
      @calibration_doc.sum { |line| calbration_value(line) }
    end

    def calbration_value(line)
      first = line.index(DIGIT)
      last = line.rindex(DIGIT)

      (line[first].to_i * 10) + line[last].to_i
    end
  end
end
