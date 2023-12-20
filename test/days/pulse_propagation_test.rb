# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/pulse_propagation'

class AOC2023::PulsePropagationTest < Minitest::Test
  INPUT1 = <<~EOI
    broadcaster -> a, b, c
    %a -> b
    %b -> c
    %c -> inv
    &inv -> a
  EOI

  INPUT2 = <<~EOI
    broadcaster -> a
    %a -> inv, con
    &inv -> b
    %b -> con
    &con -> output
  EOI

  def setup
    @pp = AOC2023::PulsePropagation.new
  end

  def test_read_config
    sources, components = @pp.read_config(INPUT1)

    %w[a b c inv].each do |name|
      assert_includes(sources, name)
      assert_includes(components, name)
    end

    %w[broadcaster rx output].each do |name|
      assert_includes(components, name)
    end
  end

  def test_part1
    @pp.setup(INPUT2)

    assert_equal(11_687_500, @pp.part1)
  end
end
