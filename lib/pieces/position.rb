class Position
  attr_accessor :piece, :height, :width, :layout, :rotation, :mirror, :vertical, :length
  
  def initialize( piece, is_vertical, layout, mirror = false, rotation = 0 )
    @piece = piece
    @vertical = is_vertical
    if( is_vertical )
      @height = piece.size
      @width = 1
    else
      @width = piece.size
      @height = 1
    end
    @length = piece.size
    @layout = layout
    @rotation = rotation
    @mirror = mirror
  end
end
