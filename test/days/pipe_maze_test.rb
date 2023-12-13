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

  INPUT2 = <<~EOI
    FF7FSF7F7F7F7F7F---7
    L|LJ||||||||||||F--J
    FL-7LJLJ||||||LJL-77
    F--JF--7||LJLJ7F7FJ-
    L---JF-JLJ.||-FJLJJ7
    |F|F-JF---7F7-L7L|7|
    |FFJF7L7F-JF7|JL---7
    7-L-JL7||F7|L7F-7F7|
    L.L7LFJ|||||FJL7||LJ
    L7JLJL-JLJLJL--JLJ.L
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

  def test_part2
    @pm.setup(INPUT2)

    assert_equal(10, @pm.part2)
  end
end
