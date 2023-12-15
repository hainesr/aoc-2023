# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class LensLibrary < Day
    def setup(input = read_input_file.chomp)
      @instructions = input.split(',')
      @boxes = Array.new(256) { {} }
    end

    def part1
      @instructions.sum { |instr| hash(instr) }
    end

    def part2
      @instructions.each do |instr|
        label, length = parse_instruction(instr)
        box = hash(label)

        if length.nil?
          @boxes[box].delete(label)
        else
          @boxes[box][label] = length.to_i
        end
      end

      @boxes.map.with_index(1) do |box, i|
        box.each_pair.map.with_index(1) do |(_, length), j|
          i * j * length
        end.sum
      end.sum
    end

    def hash(string)
      string.each_char.reduce(0) { |acc, c| ((acc + c.ord) * 17) % 256 }
    end

    def parse_instruction(instr)
      if instr.end_with?('-')
        [instr.chomp('-'), nil]
      else
        instr.split('=')
      end
    end
  end
end
