# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class CubeConundrum < Day
    def setup(input = read_input_file.chomp)
      @games = parse_games(input)
    end

    def part1
      sum = 0

      @games.each_with_index do |game, i|
        sum += (i + 1) if game_possible?(game)
      end

      sum
    end

    def part2
      @games.sum { |game| game_power(game) }
    end

    def game_possible?(game, max_red = 12, max_green = 13, max_blue = 14)
      game.each do |set|
        return false if set[0] > max_red || set[1] > max_green || set[2] > max_blue
      end

      true
    end

    def game_power(game)
      game.max_by { |r, _, _| r }[0] *
        game.max_by { |_, g, _| g }[1] *
        game.max_by { |_, _, b| b }[2]
    end

    def parse_games(input)
      input.split("\n").map do |line|
        _, sets = line.split(':')
        sets.split(';').map do |set|
          reveal = { 'red' => 0, 'green' => 0, 'blue' => 0 }

          set.split(',').map do |cubes|
            num, colour = cubes.split
            reveal[colour] = num.to_i
          end

          reveal.values
        end
      end
    end
  end
end
