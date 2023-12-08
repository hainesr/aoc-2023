# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

require 'prime'

module AOC2023
  class HauntedWasteland < Day
    NODE_MATCHER = Regexp.new('([A-Z]{3}) = \(([A-Z]{3}), ([A-Z]{3})\)')

    def setup(input = read_input_file.chomp)
      @instructions, @nodes = read_map(input)
    end

    def part1
      navigate_map('AAA', 'ZZZ')
    end

    def part2
      start_nodes = @nodes.keys.select { |n| n.end_with?('A') }

      start_nodes.flat_map do |start|
        Prime.prime_division(navigate_map(start, 'Z'))
      end.flatten.uniq.reduce(&:*)
    end

    def navigate_map(start, finish)
      instr_idx = 0
      current_node = start
      count = 0

      loop do
        break if current_node.end_with?(finish)

        current_node = @nodes[current_node][@instructions[instr_idx]]
        instr_idx = (instr_idx + 1) % @instructions.length
        count += 1
      end

      count
    end

    def read_map(input)
      instructions, nodes = input.split("\n\n")
      node_map = nodes.lines(chomp: true).to_h do |line|
        n = NODE_MATCHER.match(line)

        [n[1], [n[2], n[3]]]
      end

      [instructions.tr('LR', '01').chars.map(&:to_i), node_map]
    end
  end
end
