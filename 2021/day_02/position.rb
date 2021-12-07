class Position
  attr_accessor :horizontal_position, :depth, :aim

  def initialize
    @horizontal_position = 0
    @depth = 0
    @aim = 0
  end

  def increase_horizontal_position_by(units)
    @horizontal_position += units
    adjust_depth_by(units)
  end

  def increase_aim_by(units)
    @aim += units
  end

  def decrease_aim_by(units)
    @aim -= units
  end

  def adjust_depth_by(units)
    @depth += units * @aim if @aim > 0
  end
end
