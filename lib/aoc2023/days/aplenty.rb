# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class Aplenty < Day
    CMD_RXP = Regexp.new('([xmas])(<|>)([0-9]{1,4}):(A|R|[a-z]+)')
    CAT_MAP = { 'x' => 0, 'm' => 1, 'a' => 2, 's' => 3 }.freeze
    END_STATES = [:A, :R].freeze

    def setup(input = read_input_file.chomp)
      @parts, @workflows = read_input(input)
    end

    def part1
      @parts.sum do |part|
        run_workflow(part, @workflows) == :A ? part.sum : 0
      end
    end

    def part2
      calculate_ranges([1..4000, 1..4000, 1..4000, 1..4000], @workflows)
    end

    def run_workflow(part, workflows, workflow = :in)
      workflows[workflow].each do |(cat, op, num, dest)|
        if op.nil?
          return cat if END_STATES.include?(cat)

          return run_workflow(part, workflows, cat)
        end

        next unless part[cat].method(op).call(num)

        return END_STATES.include?(dest) ? dest : run_workflow(part, workflows, dest)
      end
    end

    def calculate_ranges(ranges, workflows, workflow = :in)
      return 0 if workflow == :R
      return ranges.map(&:size).reduce(1, :*) if workflow == :A

      workflows[workflow].sum do |(cat, op, num, dest)|
        next calculate_ranges(ranges, workflows, cat) if op.nil?

        new_ranges = ranges.dup
        if op == :<
          new_ranges[cat] = new_ranges[cat].begin..(num - 1)
          ranges[cat] = num..ranges[cat].end
        else
          new_ranges[cat] = (num + 1)..new_ranges[cat].end
          ranges[cat] = ranges[cat].begin..num
        end

        calculate_ranges(new_ranges, workflows, dest)
      end
    end

    def read_input(input)
      workflows, parts = input.split("\n\n")

      [read_parts(parts), read_workflows(workflows)]
    end

    private

    def read_parts(input)
      input.each_line(chomp: true).map do |part|
        part[1..-2].split(',').map do |p|
          _, v = p.split('=')

          v.to_i
        end
      end
    end

    def read_workflows(input)
      input.each_line(chomp: true).to_h do |line|
        name, instr = line.chomp('}').split('{')
        cmds = instr.split(',').map do |cmd|
          if cmd.include?(':')
            cat, test, num, dest = CMD_RXP.match(cmd).captures
            [CAT_MAP[cat], test.to_sym, num.to_i, dest.to_sym]
          else
            [cmd.to_sym]
          end
        end

        [name.to_sym, cmds]
      end
    end
  end
end
