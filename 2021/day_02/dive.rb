require_relative 'submarine'

class Dive
  def self.call
    submarine = Submarine.new
    entries = File.readlines('input.txt').map { |measurement| measurement.strip.split }

    entries.each do |direction, units|
      submarine.move(direction, units)
    end

    puts submarine.final_position
  end
end

Dive.call
