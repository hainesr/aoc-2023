# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2023/days/aplenty'

class AOC2023::AplentyTest < Minitest::Test
  INPUT = <<~EOI
    px{a<2006:qkq,m>2090:A,rfg}
    pv{a>1716:R,A}
    lnx{m>1548:A,A}
    rfg{s<537:gd,x>2440:R,A}
    qs{s>3448:A,lnx}
    qkq{x<1416:A,crn}
    crn{x>2662:A,R}
    in{s<1351:px,qqz}
    qqz{s>2770:qs,m<1801:hdj,R}
    gd{a>3333:R,R}
    hdj{m>838:A,pv}

    {x=787,m=2655,a=1222,s=2876}
    {x=1679,m=44,a=2067,s=496}
    {x=2036,m=264,a=79,s=2244}
    {x=2461,m=1339,a=466,s=291}
    {x=2127,m=1623,a=2188,s=1013}
  EOI

  def setup
    @aa = AOC2023::Aplenty.new
  end

  def test_read_input
    parts, workflows = @aa.read_input(INPUT)

    assert_equal(5, parts.size)
    assert_equal([2127, 1623, 2188, 1013], parts[-1])
    assert_equal(11, workflows.size)
    assert_equal([[2, :<, 2006, :qkq], [1, :>, 2090, :A], [:rfg]], workflows[:px])
  end

  def test_run_workflow
    parts, workflows = @aa.read_input(INPUT)

    [:A, :R, :A, :R, :A].each_with_index do |result, i|
      assert_equal(result, @aa.run_workflow(parts[i], workflows))
    end
  end

  def test_part1
    @aa.setup(INPUT)

    assert_equal(19_114, @aa.part1)
  end

  def test_part2
    @aa.setup(INPUT)

    assert_equal(167_409_079_868_000, @aa.part2)
  end
end
