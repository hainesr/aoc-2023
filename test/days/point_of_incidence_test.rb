# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/point_of_incidence'

class AOC2023::PointOfIncidenceTest < Minitest::Test
  INPUT = <<~EOI
    #.##..##.
    ..#.##.#.
    ##......#
    ##......#
    ..#.##.#.
    ..##..##.
    #.#.##.#.

    #...##..#
    #....#..#
    ..##..###
    #####.##.
    #####.##.
    ..##..###
    #....#..#
  EOI

  def setup
    @poi = AOC2023::PointOfIncidence.new
  end

  def test_read_grids
    assert_equal(
      [
        [[358, 90, 385, 385, 90, 102, 346], [89, 24, 103, 66, 37, 37, 66, 103, 24]],
        [[281, 265, 103, 502, 502, 103, 265], [109, 12, 30, 30, 76, 97, 30, 30, 115]]
      ],
      @poi.read_grids(INPUT)
    )
  end

  def test_find_reflection
    grids = @poi.read_grids(INPUT)

    assert_nil(@poi.find_reflection(grids[0][0]))
    assert_equal(5, @poi.find_reflection(grids[0][1]))
    assert_equal(4, @poi.find_reflection(grids[1][0]))
    assert_nil(@poi.find_reflection(grids[1][1]))
  end

  def test_part1
    @poi.setup(INPUT)

    assert_equal(405, @poi.part1)
  end
end
