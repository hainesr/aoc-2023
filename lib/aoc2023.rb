# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'rubygems'
require 'bundler/setup'

require 'aoc2023/day'

module AOC2023
  INPUT_DIR = ::File.expand_path('../etc', __dir__)

  DAY_MAP = [
    nil, # There is no day zero!
    'trebuchet',
    'cube_conundrum',
    'gear_ratios',
    'scratchcards',
    'seed_fertilizer',
    'wait_for_it'
  ].freeze

  def self.class_from_day(day)
    class_name = day.split('_').map(&:capitalize).join
    class_path = "AOC2023::#{class_name}"
    class_path.split('::').reduce(Object) { |o, c| o.const_get c }
  end
end
