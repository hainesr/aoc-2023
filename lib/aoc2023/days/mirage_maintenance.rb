# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class MirageMaintenance < Day
    def setup(input = read_input_file.chomp)
      @lists = input.lines(chomp: true).map do |line|
        line.split.map(&:to_i)
      end
    end

    def part1
      @lists.sum { |list| next_value(list) }
    end

    def part2
      @lists.sum { |list| prev_value(list) }
    end

    def next_value(list)
      lists = [list]
      new_list = list

      until new_list.all?(&:zero?)
        new_list = diffs(new_list)
        lists << new_list
      end

      lists.reverse.each_cons(2) do |l1, l2|
        l2 << (l2.last + l1.last)
      end.last.last
    end

    def prev_value(list)
      lists = [list]
      new_list = list

      until new_list.all?(&:zero?)
        new_list = diffs(new_list)
        lists << new_list
      end

      lists.reverse.each_cons(2) do |l1, l2|
        l2.unshift(l2.first - l1.first)
      end.last.first
    end

    def diffs(list)
      list.each_cons(2).map do |first, second|
        second - first
      end
    end
  end
end
