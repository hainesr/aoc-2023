# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/camel_cards'

class AOC2023::CamelCardsTest < Minitest::Test
  INPUT = <<~EOI
    32T3K 765
    T55J5 684
    KK677 28
    KTJJT 220
    QQQJA 483
  EOI

  def setup
    @cc = AOC2023::CamelCards.new
  end

  def test_read_hands
    hands = @cc.read_hands(INPUT)

    assert_equal(['32T3K', [1, 0, 8, 1, 11], 765], hands[0])
    assert_equal(['QQQJA', [10, 10, 10, 9, 12], 483], hands[4])
  end

  def test_part1
    @cc.setup(INPUT)

    assert_equal(6440, @cc.part1)
  end

  def test_part2
    @cc.setup(INPUT)

    assert_equal(5905, @cc.part2)
  end
end
