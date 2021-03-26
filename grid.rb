# Class Grid
class Grid
  attr_reader :top_right_x, :top_right_y

  # Constructor
  def initialize(top_right_x = 0, top_right_y = 0)
    @top_right_x = top_right_x
    @top_right_y = top_right_y
  end

  # Validates if the coordinate is in the grid and the face is valid
  def is_in_grid?(x, y, face)
    if x.between?(0, @top_right_x) &&
       y.between?(0, @top_right_y) &&
       ["N", "S", "E", "W"].include?(face)
       return true
    else
      false
    end
  end
end
