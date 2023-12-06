# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class SeedFertilizer < Day
    def setup(input = read_input_file.chomp)
      @seeds, @maps = parse_input(input)
    end

    def part1
      @seeds.map { |seed| location(seed, @maps) }.min
    end

    def location(seed, maps)
      current = seed

      maps.each do |map|
        map.each do |range, change|
          if range.include?(current)
            current += change
            break
          end
        end
      end

      current
    end

    def parse_input(input)
      chunks = input.lines("\n\n", chomp: true)

      _, seeds = chunks.shift.split(': ')

      [
        seeds.split.map(&:to_i).freeze,
        parse_maps(chunks)
      ]
    end

    def parse_maps(chunks)
      chunks.map do |chunk|
        lines = chunk.lines(chomp: true)
        lines.shift
        lines.map do |line|
          dest, src, len = line.split.map(&:to_i)
          [(src..(src + len - 1)), dest - src].freeze
        end
      end
    end
  end
end
