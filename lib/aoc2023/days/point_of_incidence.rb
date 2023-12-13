# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class PointOfIncidence < Day
    def setup(input = read_input_file.chomp)
      @grids = read_grids(input)
    end

    def part1
      @grids.sum do |(horiz, vert)|
        h = find_reflection(horiz)
        v = find_reflection(vert)

        (h.nil? ? 0 : (h * 100)) + (v.nil? ? 0 : v)
      end
    end

    def find_reflection(grid)
      (1...grid.size).each do |i|
        lhs = grid[0...i]
        rhs = grid[i..]
        test_length = [lhs.size, rhs.size].min

        return i if lhs.reverse[...test_length] == rhs[...test_length]
      end

      nil
    end

    def read_grids(input)
      input.each_line("\n\n", chomp: true).map do |grid|
        [
          grid.lines(chomp: true).map do |line|
            Integer(line.tr('.#', '01'), 2)
          end,
          transpose(grid).map do |line|
            Integer(line.tr('.#', '01'), 2)
          end
        ]
      end
    end

    private

    def transpose(grid)
      grid.lines(chomp: true).map(&:chars).transpose.map(&:join)
    end
  end
end
