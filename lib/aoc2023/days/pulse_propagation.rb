# frozen_string_literal: true

# Advent of Code 2023
#
# Robert Haines
#
# Public Domain

require 'aoc2023'

module AOC2023
  class PulsePropagation < Day
    def setup(input = read_input_file.chomp)
      @sources, @components = read_config(input)
    end

    def part1
      pulse_counts = { true => 0, false => 0 }

      1000.times do
        queue = [['broadcaster', 'button', false]]

        until queue.empty?
          queue = queue.flat_map do |to, from, pulse|
            pulse_counts[pulse] += 1
            @components[to][pulse, from]
          end
        end
      end

      pulse_counts[true] * pulse_counts[false]
    end

    def part2
      # Need the source to 'rx' to send a low pulse. The source of 'rx' is a
      # conjunction (&) so we need *its* sources to all have high pulses.
      # Find the periods of all those sources going high, and we can do LCM
      # for the answer.
      rx_source = @sources['rx'].first # Hopefully there's only one :-s
      high_times = @sources[rx_source].to_h { |s| [s, []] }

      # We just did 1000 pushes, so start at push 1001.
      1001.step do |t|
        queue = [['broadcaster', 'button', false]]

        until queue.empty?
          queue = queue.flat_map do |to, from, pulse|
            if pulse && to == rx_source
              high_times[from] << t

              if high_times.values.all? { |v| v.size >= 3 }
                return periods(high_times).reduce(1) { |acc, period| acc.lcm(period) }
              end
            end

            @components[to][pulse, from]
          end
        end
      end
    end

    def read_config(input)
      destinations = input.each_line(chomp: true).to_h do |line|
        name, outs = line.split(' -> ')
        [name, outs.split(', ')]
      end

      sources = Hash.new { |h, k| h[k] = [] }
      destinations.each do |source, dests|
        dests.each { |d| sources[d] << (source[0] == 'b' ? source : source[1..]) }
      end
      sources.default_proc = nil # No longer want to return [] by default.

      [sources, build_components(sources, destinations)]
    end

    private

    def periods(times)
      times.values.map do |ts|
        ts.each.with_index(1).all? { |t, i| t == ts[0] * i } ? ts[0] : nil
      end
    end

    def build_components(sources, destinations) # rubocop:disable Metrics/CyclomaticComplexity
      sinks = {
        'rx' => ->(_, _) { [] },    # This is the 'sink' for the real input.
        'output' => ->(_, _) { [] } # This is the 'sink' for the test input.
      }

      # Use `true` for a 'high' pulse, and `false` for a low one.
      components = destinations.to_h do |name, dests|
        # Strip `%` and `&` but preserve `broadcaster`.
        type = name[0]
        name = (type == 'b' ? name : name[1..])

        func = case type
               when 'b'
                 lambda do |pulse, _|
                   dests.map { |dest| [dest, name, pulse] }
                 end
               when '%'
                 state = false

                 lambda do |pulse, _|
                   return [] if pulse # Do nothing on a high pulse.

                   state = !state
                   dests.map { |dest| [dest, name, state] }
                 end
               when '&'
                 state = sources[name].to_h { |src| [src, false] }

                 lambda do |pulse, from|
                   state[from] = pulse
                   rtn = !state.values.all?

                   dests.map { |dest| [dest, name, rtn] }
                 end
               end

        [name, func]
      end

      sinks.merge(components)
    end
  end
end
