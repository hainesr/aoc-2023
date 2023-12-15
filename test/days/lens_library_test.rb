# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/lens_library'

class AOC2023::LensLibraryTest < Minitest::Test
  INPUT = 'rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7'

  def setup
    @ll = AOC2023::LensLibrary.new
  end

  def test_hash
    results = [30, 253, 97, 47, 14, 180, 9, 197, 48, 214, 231]

    INPUT.split(',').zip(results).each do |instr, result|
      assert_equal(result, @ll.hash(instr))
    end
  end

  def test_part1
    @ll.setup(INPUT)

    assert_equal(1320, @ll.part1)
  end
end
