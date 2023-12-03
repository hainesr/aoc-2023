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

  def test_partnumber
    part = AOC2023::GearRatios::PartNumber.new(4, 0, 0)
    part.add_value(6)
    part.add_value(7)
    part.finish

    assert_equal(467, part.value)
    assert_equal('<value: 467; length: 3; coord: [0, 0]>', part.inspect)
    border = part.border

    assert_equal(12, border.length)
    assert_equal(
      [
        [-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1],
        [1, 1], [2, -1], [2, 1], [3, -1], [3, 0], [3, 1]
      ],
      border
    )
  end

  def test_part1
    @gr.setup(INPUT)

    assert_equal(4361, @gr.part1)
  end

  def test_part2
    @gr.setup(INPUT)

    assert_equal(467_835, @gr.part2)
  end
end
