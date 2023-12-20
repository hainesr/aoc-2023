# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/lavaduct_lagoon'

class AOC2023::LavaductLagoonTest < Minitest::Test
  INPUT = <<~EOI
    R 6 (#70c710)
    D 5 (#0dc571)
    L 2 (#5713f0)
    D 2 (#d2c081)
    R 2 (#59c680)
    D 2 (#411b91)
    L 5 (#8ceee2)
    U 2 (#caa173)
    L 1 (#1b58a2)
    U 2 (#caa171)
    R 2 (#7807d2)
    U 3 (#a77fa3)
    L 2 (#015232)
    U 2 (#7a21e3)
  EOI

  def setup
    @ll = AOC2023::LavaductLagoon.new
  end

  def test_read_instructions
    instr = @ll.read_instructions(INPUT)

    assert_equal([6, 6, 4, 4, 6, 6, 1, 1, 0, 0, 2, 2, 0, 0], instr[0])
    assert_equal([0, 5, 5, 7, 7, 9, 9, 7, 7, 5, 5, 2, 2, 0], instr[1])
    assert_equal([6, 5, 2, 2, 2, 2, 5, 2, 1, 2, 2, 3, 2, 2], instr[2])
    assert_equal(
      [
        461_937, 56_407, 356_671, 863_240, 367_720, 266_681, 577_262,
        829_975, 112_010, 829_975, 491_645, 686_074, 5411, 500_254
      ],
      instr[5]
    )
  end

  def test_part1
    @ll.setup(INPUT)

    assert_equal(62, @ll.part1)
  end

  def test_part2
    @ll.setup(INPUT)

    assert_equal(952_408_144_115, @ll.part2)
  end
end
