require_relative 'submarine'

class Dive
  def self.call
    entries = File.readlines('input.txt').map { |measurement| measurement.strip.split }    
    submarine = Submarine.new

    entries.each do |direction, units|
      submarine.move(direction, units)
    end

    puts submarine.final_position
  end
end

Dive.call
