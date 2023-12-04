# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/scratchcards'

class AOC2023::ScratchcardsTest < Minitest::Test
  INPUT = <<~EOI
    Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
    Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
    Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
    Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
    Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
    Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
  EOI

  def setup
    @ss = AOC2023::Scratchcards.new
  end

  def test_read_and_score_cards
    scores = @ss.read_and_score_cards(INPUT)

    [4, 2, 2, 1, 0, 0].each_with_index do |score, i|
      assert_equal(score, scores[i])
    end
  end

  def test_part1
    @ss.setup(INPUT)

    assert_equal(13, @ss.part1)
  end

  def test_part2
    @ss.setup(INPUT)

    assert_equal(30, @ss.part2)
  end
end
