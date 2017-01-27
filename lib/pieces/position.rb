class Position
  attr_accessor :piece, :height, :width, :stair_location
  
  def initialize( piece, height, width, stair_location )
    @piece = piece
    @height = height
    @width = width
    @stair_location = stair_location
  end

  
end
