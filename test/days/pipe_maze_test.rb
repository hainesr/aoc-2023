# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/pipe_maze'

class AOC2023::PipeMazeTest < Minitest::Test
  INPUT1 = <<~EOI
    .....
    .S-7.
    .|.|.
    .L-J.
    .....
  EOI

  def setup
    @pm = AOC2023::PipeMaze.new
  end

  def test_read_pipes
    pipes, width, start, start_dir = @pm.read_pipes(INPUT1)

    assert_equal('......F-7..|.|..L-J......', pipes)
    assert_equal(5, width)
    assert_equal(6, start)
    assert_equal(1, start_dir)
  end

  def test_navigate
    pipes, width, start, start_dir = @pm.read_pipes(INPUT1)
    pipe = @pm.navigate(pipes, width, start, start_dir)

    assert_equal([6, 7, 8, 13, 18, 17, 16, 11], pipe)
  end

  def test_part1
    @pm.setup(INPUT1)

    assert_equal(4, @pm.part1)
  end
end
