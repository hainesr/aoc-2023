# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/cube_conundrum'

class AOC2023::CubeConundrumTest < Minitest::Test
  INPUT = <<~EOI
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  EOI

  def setup
    @cc = AOC2023::CubeConundrum.new
  end

  def test_parse_games
    games = @cc.parse_games(INPUT)

    assert_equal([4, 0, 3], games[0][0])
    assert_equal([0, 2, 0], games[0][2])
    assert_equal([20, 8, 6], games[2][0])
  end

  def test_game_possible?
    games = @cc.parse_games(INPUT)

    assert(@cc.game_possible?(games[0]))
    assert(@cc.game_possible?(games[1]))
    refute(@cc.game_possible?(games[2]))
    refute(@cc.game_possible?(games[3]))
    assert(@cc.game_possible?(games[4]))
  end

  def test_game_power
    games = @cc.parse_games(INPUT)

    assert_equal(48, @cc.game_power(games[0]))
    assert_equal(12, @cc.game_power(games[1]))
    assert_equal(1560, @cc.game_power(games[2]))
    assert_equal(630, @cc.game_power(games[3]))
    assert_equal(36, @cc.game_power(games[4]))
  end

  def test_part1
    @cc.setup(INPUT)
    assert_equal(8, @cc.part1)
  end

  def test_part2
    @cc.setup(INPUT)
    assert_equal(2286, @cc.part2)
  end
end
