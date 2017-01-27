class Position
  attr_accessor :piece, :height, :width, :layout
  
  def initialize( piece, is_vertical, layout )
    @piece = piece
    if( is_vertical )
      @height = piece.size
      @width = 1
    else
      @width = piece.size
      @height = 1
    end
    @layout = layout
  end

  
end
