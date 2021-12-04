class Dive
  attr_accessor :horizontal_position, :depth, :aim, :entries

  def initialize
    @horizontal_position = 0
    @depth = 0
    @aim = 0
    @entries = File.readlines('input.txt').map { |measurement| measurement.strip.split }
  end

  def multiply_final_depth_and_final_horizontal_position
    @entries.each do |direction, units|
      units = units.to_i

      case direction
      when "forward" then @horizontal_position += units
      when "down" then @depth += units
      when "up" then @depth -= units
      else
        raise ArgumentError, "Wrong direction!"
      end
    end

    @horizontal_position * @depth
  end

  def multiply_final_depth_and_final_horizontal_position_using_aim
    @entries.each do |direction, units|
      units = units.to_i

      case direction
      when "forward"
        @horizontal_position += units
        @depth = @depth + (@aim * units)
      when "down" then @aim += units
      when "up" then @aim -= units
      else
        raise ArgumentError, "Wrong direction!"
      end
    end

    @horizontal_position * @depth
  end
end

puts Dive.new.multiply_final_depth_and_final_horizontal_position
puts Dive.new.multiply_final_depth_and_final_horizontal_position_using_aim
