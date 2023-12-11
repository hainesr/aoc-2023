# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/cosmic_expansion'

class AOC2023::CosmicExpansionTest < Minitest::Test
  INPUT = <<~EOI
    ...#......
    .......#..
    #.........
    ..........
    ......#...
    .#........
    .........#
    ..........
    .......#..
    #...#.....
  EOI

  def setup
    @ce = AOC2023::CosmicExpansion.new
  end

  def test_read_space
    galaxies, empty_rows, empty_columns = @ce.read_space(INPUT)

    assert_equal(
      [[3, 0], [7, 1], [0, 2], [6, 4], [1, 5], [9, 6], [7, 8], [0, 9], [4, 9]],
      galaxies
    )
    assert_equal([3, 7], empty_rows)
    assert_equal([2, 5, 8], empty_columns)
  end

  def test_manhattan_distance
    galaxies, empty_rows, empty_columns = @ce.read_space(INPUT)

    assert_equal(15, @ce.manhattan_distance(galaxies[0], galaxies[6], empty_rows, empty_columns))
    assert_equal(17, @ce.manhattan_distance(galaxies[2], galaxies[5], empty_rows, empty_columns))
    assert_equal(5, @ce.manhattan_distance(galaxies[8], galaxies[7], empty_rows, empty_columns))
  end

  def test_part1
    @ce.setup(INPUT)

    assert_equal(374, @ce.part1)
  end

  def test_part2
    @ce.setup(INPUT)

    assert_equal(1030, @ce.part2(factor: 10))
    assert_equal(8410, @ce.part2(factor: 100))
  end
end
