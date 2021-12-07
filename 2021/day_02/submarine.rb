require_relative 'position'

class Submarine
  attr_accessor :position

  def initialize
    @position = Position.new
  end

  def move(direction, units)
    units = units.to_i

    case direction.to_sym
    when :forward then go_forward(units)
    when :down then go_down(units)
    when :up then go_up(units)
    else
      raise ArgumentError, "Wrong direction!"
    end
  end

  def final_position
    position.horizontal_position * position.depth
  end

  private

  def go_forward(units)
    position.increase_horizontal_position_by(units)
  end

  def go_down(units)
    position.increase_aim_by(units)
  end

  def go_up(units)
    position.decrease_aim_by(units)
  end
end
