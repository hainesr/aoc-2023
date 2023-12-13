# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class PipeMaze < Day
    def setup(input = read_input_file.chomp)
      @pipes, @width, @start, @start_dir = read_pipes(input)
    end

    def part1
      navigate(@pipes, @width, @start, @start_dir).size / 2
    end

    def part2
      pipe = navigate(@pipes, @width, @start, @start_dir)
      inside = []

      edge = '|F7'.chars.to_h { |c| [c, true] }.freeze
      @pipes.chars.each_slice(@width).with_index do |row, y|
        out = true
        row.each_with_index do |c, x|
          pos = (y * @width) + x
          if pipe.include?(pos)
            out ^= edge[c]
          else
            inside << pos unless out
          end
        end
      end

      inside.size
    end

    def navigate(pipes, width, start, start_dir)
      directions = {
        '|' => { -width => -width, width => width },
        '-' => { -1 => -1, 1 => 1 },
        'L' => { -1 => -width, width => 1 },
        'F' => { -width => 1, -1 => width },
        'J' => { 1 => -width, width => -1 },
        '7' => { -width => -1, 1 => width }
      }.each_value(&:freeze).freeze

      pipe = [start]
      position = start
      direction = start_dir

      until position == start && pipe.size > 1
        position += direction
        direction = directions[pipes[position]][direction]
        pipe << position
      end

      pipe.uniq
    end

    def read_pipes(input)
      pipes = input.lines(chomp: true)
      width = pipes[0].size
      height = pipes.size
      pipes = pipes.join
      start = pipes.chars.each_with_index.filter_map { |c, i| i if c == 'S' }[0]
      start_conns = start_connections(pipes, width, height, start)

      pipes[start] = start_pipe(start_conns, width)
      start_dir = start_conns[0]

      [pipes, width, start, start_dir]
    end

    private

    def start_connections(pipes, width, height, start)
      y, x = start.divmod(width)

      [
        (-width if y.positive? && '|F7'.include?(pipes[start - width])),
        (-1 if x.positive? && '-FL'.include?(pipes[start - 1])),
        (1 if x < width - 1 && '-7J'.include?(pipes[start + 1])),
        (width if y < height - 1 && '|LJ'.include?(pipes[start + width]))
      ].compact
    end

    def start_pipe(connections, width)
      case connections
      when [-width, -1] then 'J'
      when [-width, 1] then 'L'
      when [-width, width] then '|'
      when [-1, 1] then '-'
      when [-1, width] then '7'
      when [1, width] then 'F'
      end
    end
  end
end
