# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/haunted_wasteland'

class AOC2023::HauntedWastelandTest < Minitest::Test
  INPUT = <<~EOI
    RL

    AAA = (BBB, CCC)
    BBB = (DDD, EEE)
    CCC = (ZZZ, GGG)
    DDD = (DDD, DDD)
    EEE = (EEE, EEE)
    GGG = (GGG, GGG)
    ZZZ = (ZZZ, ZZZ)
  EOI

  def setup
    @hw = AOC2023::HauntedWasteland.new
  end

  def test_part1
    @hw.setup(INPUT)

    assert_equal(2, @hw.part1)
  end
end
