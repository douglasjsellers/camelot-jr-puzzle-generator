class Position
  attr_accessor :piece, :height, :width, :layout, :rotation, :mirror
  
  def initialize( piece, is_vertical, layout, mirror = false, rotation = 0 )
    @piece = piece
    if( is_vertical )
      @height = piece.size
      @width = 1
    else
      @width = piece.size
      @height = 1
    end
    @layout = layout
    @rotation = rotation
    @mirror = mirror
  end

  
end
