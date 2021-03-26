require_relative 'direction'

# Class Robot
class Robot
  attr_accessor :id, :dir

  def initialize(index, x, y, face)
    @id = index
    @dir = Direction.new(x, y, face)
  end

  # Show the robot location
  def print_current_location
    puts [@dir.x_value, @dir.y_value, @dir.face].join(' ')
  end

  # Move forward
  def move
    @dir.move_forward
  end

  # Turn right
  def turn_right
    @dir.turn_right
  end

  # Turn left 
  def turn_left
    @dir.turn_left
  end
end
