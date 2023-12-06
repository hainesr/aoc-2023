# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/wait_for_it'

class AOC2023::WaitForItTest < Minitest::Test
  INPUT = <<~EOI
    Time:      7  15   30
    Distance:  9  40  200
  EOI

  def setup
    @wfi = AOC2023::WaitForIt.new
  end

  def test_error_margin
    assert_equal(4, @wfi.error_margin(7, 9))
    assert_equal(8, @wfi.error_margin(15, 40))
    assert_equal(9, @wfi.error_margin(30, 200))
  end

  def test_part1
    @wfi.setup(INPUT)

    assert_equal(288, @wfi.part1)
  end
end
