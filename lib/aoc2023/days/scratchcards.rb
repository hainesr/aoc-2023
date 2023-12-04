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
      @scores = read_and_score_cards(input)
    end

    def part1
      @scores.sum { |score| score.positive? ? 2**(score - 1) : 0 }
    end

    def read_and_score_cards(input)
      cards = input.each_line(chomp: true).map do |line|
        _, numbers = line.split(':')
        numbers.split('|').map do |list|
          list.split.map(&:to_i)
        end
      end

      cards.map { |winners, nums| nums & winners }.map(&:length)
    end
  end
end
