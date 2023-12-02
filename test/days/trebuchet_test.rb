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

  INPUT2 = <<~EOI
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
  EOI

  def setup
    @tt = AOC2023::Trebuchet.new
  end

  def test_calibration_value
    assert_equal(12, @tt.calibration_value('1abc2'))
    assert_equal(38, @tt.calibration_value('pqr3stu8vwx'))
    assert_equal(15, @tt.calibration_value('a1b2c3d4e5f'))
    assert_equal(77, @tt.calibration_value('treb7uchet'))
  end

  def test_parsed_calibration_value
    assert_equal(29, @tt.parsed_calibration_value('two1nine'))
    assert_equal(83, @tt.parsed_calibration_value('eightwothree'))
    assert_equal(13, @tt.parsed_calibration_value('abcone2threexyz'))
    assert_equal(24, @tt.parsed_calibration_value('xtwone3four'))
    assert_equal(42, @tt.parsed_calibration_value('4nineeightseven2'))
    assert_equal(14, @tt.parsed_calibration_value('zoneight234'))
    assert_equal(76, @tt.parsed_calibration_value('7pqrstsixteen'))
  end

  def test_part1
    @tt.setup(INPUT)
    assert_equal(142, @tt.part1)
  end

  def test_part2
    @tt.setup(INPUT2)
    assert_equal(281, @tt.part2)
  end
end
