# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class GearRatios < Day
    SYMBOLS = %w[# $ % & * + - / = @].freeze

    def setup(input = read_input_file.chomp)
      @part_numbers, @symbols = read_input(input)
    end

    def part1
      all_symbols = @symbols.values.flatten(1)

      @part_numbers.select do |part|
        part.border.any? { |coord| all_symbols.include?(coord) }
      end.sum(&:value)
    end

    def part2
      gears = @symbols['*'].map do |coord|
        @part_numbers.select { |part| part.border.include?(coord) }
      end

      gears.sum do |parts|
        next 0 unless parts.length == 2

        parts[0].value * parts[1].value
      end
    end

    def read_input(input)
      symbols = {}
      part_numbers = []
      part_number = nil

      input.each_line(chomp: true).with_index do |line, y|
        line.each_char.with_index do |char, x|
          if char == '.'
            part_number&.finish
            part_number = nil
            next
          end

          if SYMBOLS.include?(char)
            symbols[char] ||= []
            symbols[char] << [x, y]
            part_number&.finish
            part_number = nil
            next
          end

          if part_number.nil?
            part_number = PartNumber.new(char.to_i, x, y)
            part_numbers << part_number
          else
            part_number.add_value(char.to_i)
          end
        end
      end

      [part_numbers, symbols]
    end

    class PartNumber
      attr_reader :value, :border

      def initialize(value, x, y)
        @value = value
        @length = 1
        @x = x
        @y = y
        @border = nil
      end

      def inspect
        "<value: #{@value}; length: #{@length}; coord: [#{@x}, #{@y}]>"
      end

      def add_value(value)
        @value = (@value * 10) + value
        @length += 1
      end

      def finish
        @border = calculate_border
      end

      private

      def calculate_border
        centre = (@x...(@x + @length)).map { |x| [x, @y] }

        ((@x - 1)..(@x + @length)).flat_map do |x|
          ((@y - 1)..(@y + 1)).map do |y|
            [x, y]
          end
        end - centre
      end
    end
  end
end
