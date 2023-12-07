# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class CamelCards < Day
    CARD_MAP = %w[2 3 4 5 6 7 8 9 T J Q K A].each_with_index.to_h.freeze

    def setup(input = read_input_file.chomp)
      @hands = read_hands(input)
    end

    def part1
      sorted = @hands.sort_by { |_, h, _| [sort_helper(h), h] }

      sorted.each.with_index(1).sum { |(_, _, b), i| b * i }
    end

    def sort_helper(hand)
      card_groups = hand.tally
      card_group_frequencies = card_groups.values.sort

      card_group_frequencies.reverse
    end

    # Returns a list of ['hand', [values], bid]
    #             e.g.: ['QQQJA', [10, 10, 10, 9, 12], 483]
    def read_hands(input)
      input.each_line(chomp: true).map do |line|
        cards, bid = line.split
        [cards.freeze, cards.chars.map { |c| CARD_MAP[c] }.freeze, bid.to_i].freeze
      end
    end
  end
end
