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

    def part2
      @grids.sum do |(horiz, vert)|
        h = find_smudge(horiz)
        v = find_smudge(vert)

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

    def find_smudge(grid)
      (1...grid.size).each do |i|
        lhs = grid[0...i]
        rhs = grid[i..]
        test_length = [lhs.size, rhs.size].min
        lhs = lhs.reverse[...test_length]
        rhs = rhs[...test_length]

        difference = lhs.zip(rhs).filter_map do |(l, r)|
          l ^ r unless l == r
        end

        return i if difference.length == 1 && power_of_two?(difference.first)
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

    def power_of_two?(num)
      num != 0 && (num & (num - 1)).zero?
    end
  end
end
