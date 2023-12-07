# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class CamelCards < Day
    def setup(input = read_input_file.chomp)
      @hands = read_hands(input)
    end

    def part1
      @hands.sort.map.with_index do |hand, i|
        hand.bid * (i + 1)
      end.sum
    end

    def read_hands(input)
      input.lines(chomp: true).map do |line|
        Hand.new(*line.split)
      end
    end

    class Hand
      include Comparable

      attr_reader :bid

      PICTURE_CARD_MAP = {
        'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14
      }.freeze

      def initialize(hand, bid = 0)
        @hand = normalise(hand.chars)
        @groups = @hand.group_by { _1 }
        @bid = bid.to_i
      end

      def <=>(other)
        cmp = @groups.size <=> other.groups.size
        return -cmp unless cmp.zero?

        cmp = @groups.values.max_by(&:size).size <=> other.groups.values.max_by(&:size).size
        return cmp unless cmp.zero?

        @hand.each_with_index do |h, i|
          cmp = h <=> other.hand[i]
          return cmp unless cmp.zero?
        end

        0
      end

      protected

      attr_reader :groups, :hand

      private

      def normalise(hand)
        hand.map do |card|
          PICTURE_CARD_MAP[card] || card.to_i
        end
      end
    end
  end
end
