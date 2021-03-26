require_relative 'robot'
require_relative 'grid'

# Class DriveRobot
class DriveRobot
  attr_accessor :robot, :grid 

  # Inputs grid coordinates from the user
  def get_coordinates
    top_right_x, top_right_y = gets.chomp.split(' ')
    raise ArgumentError, 'Invalid grid coordinates' unless \
      if Integer(top_right_x) && Integer(top_right_y)
        @grid = Grid.new(top_right_x.to_i, top_right_y.to_i)
      end
  end

  # Use the input to move the robot
  def move
    STDIN.each_slice(2).each_with_index do |lines, index|
      rover_x, rover_y, rover_face = lines[0].split
      unless @grid.is_in_grid?(rover_x.to_i, rover_y.to_i, rover_face.to_s)
        puts 'Invalid coordinates:' \
             "(#{rover_x}, #{rover_y}, #{rover_face})"
        next
      end
      @robot = Robot.new(index, rover_x.to_i, rover_y.to_i, rover_face.to_s)
      catch :invalid_instruction do
        lines[1].chomp.each_char do |instruction|
          throw :invalid_instruction unless execute(instruction)
        end
      end
      next unless @robot.id != -1
      @robot.print_current_location
    end
  end

  # Execute the instructions
  def execute(instruction)
    case instruction
    when 'L'
      @robot.turn_left
    when 'M'
      @robot.move
    when 'R'
      @robot.turn_right
    else
      puts "Invalid instruction '#{instruction}'. " \
           'Instructions can be: L(left), M(move), R(right)'
      @robot.id = -1
      return false
    end
  end
end

# Executes the program
if __FILE__ == $PROGRAM_NAME
  driveRobot = DriveRobot.new
  driveRobot.get_coordinates
  driveRobot.move
end
