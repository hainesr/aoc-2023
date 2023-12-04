# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class Scratchcards < Day
    def setup(input = read_input_file.chomp)
      @games = read_cards(input)
    end

    def part1
      @games.sum { |game| score_game(game) }
    end

    def score_game((winners, numbers))
      matches = numbers.count { |num| winners.include?(num) }

      matches.positive? ? 2**(matches - 1) : 0
    end

    def read_cards(input)
      input.each_line(chomp: true).map do |line|
        _, numbers = line.split(':')
        numbers.split('|').map do |list|
          list.split.map(&:to_i)
        end
      end
    end
  end
end
