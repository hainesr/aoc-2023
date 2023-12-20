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
    'there_is_no_day_zero',
    'trebuchet',                  # Day 1.
    'cube_conundrum',
    'gear_ratios',
    'scratchcards',
    'seed_fertilizer',            # Day 5.
    'wait_for_it',
    'camel_cards',
    'haunted_wasteland',
    'mirage_maintenance',
    'pipe_maze',                  # Day 10.
    'cosmic_expansion',
    nil,
    'point_of_incidence',
    nil,
    'lens_library',               # Day 15.
    nil,
    nil,
    'lavaduct_lagoon',
    'aplenty',
    'pulse_propagation'           # Day 20.
  ].freeze

  def self.class_from_day(day)
    class_name = day.split('_').map(&:capitalize).join
    class_path = "AOC2023::#{class_name}"
    class_path.split('::').reduce(Object) { |o, c| o.const_get c }
  end
end
