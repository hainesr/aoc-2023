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
    DIGITS = Regexp.new('\d|one|two|three|four|five|six|seven|eight|nine')
    DIGIT_MAP = [
      ['one', 1],
      ['two', 2],
      ['three', 3],
      ['four', 4],
      ['five', 5],
      ['six', 6],
      ['seven', 7],
      ['eight', 8],
      ['nine', 9]
    ].freeze

    def setup(input = read_input_file.chomp)
      @calibration_doc = input.split("\n")
    end

    def part1
      @calibration_doc.sum { |line| calibration_value(line) }
    end

    def part2
      @calibration_doc.sum { |line| parsed_calibration_value(line) }
    end

    def calibration_value(line)
      first = line.index(DIGIT)
      last = line.rindex(DIGIT)

      (line[first].to_i * 10) + line[last].to_i
    end

    def parsed_calibration_value(line)
      first = line.index(DIGITS)
      last = line.rindex(DIGITS)

      (parse(line, first) * 10) + parse(line, last)
    end

    def parse(line, loc)
      digit = line[loc].to_i
      return digit unless digit.zero?

      DIGIT_MAP.each do |word, num|
        return num if line[loc..].start_with?(word)
      end
    end
  end
end
