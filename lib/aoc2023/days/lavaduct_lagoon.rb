# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class LavaductLagoon < Day
    def setup(input = read_input_file.chomp)
      @x_list, @y_list, @steps = read_instructions(input)
    end

    def part1
      area(@x_list, @y_list, @steps)
    end

    def area(xs, ys, steps)
      # Loosely based on these explanations:
      #  * https://www.wikihow.com/Calculate-the-Area-of-a-Polygon
      #  * https://sciencing.com/euclidean-distance-7829754.html

      perimeter = steps.sum
      internal_area =
        xs.zip(ys.rotate(1)).sum { |x, y| x * y } -
        ys.zip(xs.rotate(1)).sum { |x, y| x * y }

      ((perimeter + internal_area) / 2) + 1
    end

    def read_instructions(input)
      x = 0
      y = 0

      input.each_line(chomp: true).map do |line|
        dir, len, = line.split
        steps = len.to_i

        case dir
        when 'L' then x -= steps
        when 'R' then x += steps
        when 'U' then y -= steps
        when 'D' then y += steps
        end

        [x, y, steps]
      end.transpose # Return lists of x, y and steps.
    end
  end
end
