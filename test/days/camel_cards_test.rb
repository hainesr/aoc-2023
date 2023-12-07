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

  def test_hands
    hands = @cc.read_hands(INPUT)

    assert_equal(765, hands[0].bid)
  end

  def test_hands_sorting
    hands = ['AAAAA', 'KKKKK', 'T55J5', 'QQQJA'].map do |hand|
      AOC2023::CamelCards::Hand.new(hand)
    end

    assert_equal(hands[0], hands[0])
    assert_operator(hands[0], :>, hands[1])
    assert_operator(hands[2], :<, hands[3])
  end

  def test_hands_sort
    hands = @cc.read_hands(INPUT)
    sorted = hands.sort

    assert_equal(hands[0], sorted[0])
    assert_equal(hands[3], sorted[1])
    assert_equal(hands[2], sorted[2])
    assert_equal(hands[1], sorted[3])
    assert_equal(hands[4], sorted[4])
  end

  def test_part1
    @cc.setup(INPUT)

    assert_equal(6440, @cc.part1)
  end
end
