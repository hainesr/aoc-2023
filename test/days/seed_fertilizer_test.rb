# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/seed_fertilizer'

class AOC2023::SeedFertilizerTest < Minitest::Test
  INPUT = <<~EOI
    seeds: 79 14 55 13

    seed-to-soil map:
    50 98 2
    52 50 48

    soil-to-fertilizer map:
    0 15 37
    37 52 2
    39 0 15

    fertilizer-to-water map:
    49 53 8
    0 11 42
    42 0 7
    57 7 4

    water-to-light map:
    88 18 7
    18 25 70

    light-to-temperature map:
    45 77 23
    81 45 19
    68 64 13

    temperature-to-humidity map:
    0 69 1
    1 0 69

    humidity-to-location map:
    60 56 37
    56 93 4
  EOI

  def setup
    @sf = AOC2023::SeedFertilizer.new
  end

  def test_parse_input
    seeds, maps = @sf.parse_input(INPUT)

    assert_equal([79, 14, 55, 13], seeds)
    assert_equal([[(98..99), -48], [(50..97), 2]], maps[0])
    assert_equal([[(56..92), 4], [(93..96), -37]], maps[6])
  end

  def test_location
    seeds, maps = @sf.parse_input(INPUT)

    [82, 43, 86, 35].each_with_index do |location, i|
      assert_equal(location, @sf.location(seeds[i], maps))
    end
  end

  def test_part1
    @sf.setup(INPUT)

    assert_equal(35, @sf.part1)
  end
end
