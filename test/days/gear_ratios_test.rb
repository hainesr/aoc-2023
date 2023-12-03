# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/gear_ratios'

class AOC2023::GearRatiosTest < Minitest::Test
  INPUT = <<~EOI
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
  EOI

  def setup
    @gr = AOC2023::GearRatios.new
  end

  def test_read_input
    part_numbers, symbols = @gr.read_input(INPUT)

    assert_equal([[3, 1], [3, 4], [5, 8]], symbols['*'])
    assert_equal(467, part_numbers[0].value)
  end

  def test_part1
    @gr.setup(INPUT)

    assert_equal(4361, @gr.part1)
  end
end
