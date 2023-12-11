# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class CosmicExpansion < Day
    def setup(input = read_input_file.chomp)
      @galaxies, @empty_rows, @empty_columns = read_space(input)
    end

    def part1
      @galaxies.combination(2).sum do |g1, g2|
        manhattan_distance(g1, g2, @empty_rows, @empty_columns)
      end
    end

    def part2(factor: 1_000_000)
      @galaxies.combination(2).sum do |g1, g2|
        manhattan_distance(g1, g2, @empty_rows, @empty_columns, factor:)
      end
    end

    def manhattan_distance((x1, y1), (x2, y2), empty_rows, empty_columns, factor: 2)
      x_range = (x1 <= x2 ? x1...x2 : x2...x1)
      y_range = (y1 <= y2 ? y1...y2 : y2...y1)

      add_x = empty_columns.count { |x| x_range.include?(x) } * (factor - 1)
      add_y = empty_rows.count { |y| y_range.include?(y) } * (factor - 1)

      x_range.size + y_range.size + add_x + add_y
    end

    def read_space(input)
      galaxies = []
      empty_rows = []
      empty_columns = []
      width = input.index("\n")

      input.lines(chomp: true).each_with_index do |line, y|
        unless line.include?('#')
          empty_rows << y
          next
        end

        line.chars.each_with_index do |c, x|
          galaxies << [x, y] if c == '#'
        end
      end

      x_coords = galaxies.map { |x, _| x }.uniq
      (0...width).each { |x| empty_columns << x unless x_coords.include?(x) }

      [galaxies, empty_rows, empty_columns]
    end
  end
end
