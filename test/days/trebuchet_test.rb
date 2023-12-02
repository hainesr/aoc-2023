# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/trebuchet'

class AOC2023::TrebuchetTest < Minitest::Test
  INPUT = <<~EOI
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
  EOI

  def setup
    @tt = AOC2023::Trebuchet.new
    @tt.setup(INPUT)
  end

  def test_calibration_value
    assert_equal(12, @tt.calibration_value('1abc2'))
    assert_equal(38, @tt.calibration_value('pqr3stu8vwx'))
    assert_equal(15, @tt.calibration_value('a1b2c3d4e5f'))
    assert_equal(77, @tt.calibration_value('treb7uchet'))
  end

  def test_part1
    assert_equal(142, @tt.part1)
  end
end
