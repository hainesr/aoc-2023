# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/mirage_maintenance'

class AOC2023::MirageMaintenanceTest < Minitest::Test
  INPUT = <<~EOI
    0 3 6 9 12 15
    1 3 6 10 15 21
    10 13 16 21 30 45
  EOI

  def setup
    @mm = AOC2023::MirageMaintenance.new
  end

  def test_diffs
    lists = @mm.setup(INPUT)
    first = @mm.diffs(lists[0])

    assert_equal([3, 3, 3, 3, 3], first)
    assert_equal([0, 0, 0, 0], @mm.diffs(first))
  end

  def test_next_value
    lists = @mm.setup(INPUT)

    [18, 28, 68].each_with_index do |result, i|
      assert_equal(result, @mm.next_value(lists[i]))
    end
  end

  def test_part1
    @mm.setup(INPUT)

    assert_equal(114, @mm.part1)
  end
end
