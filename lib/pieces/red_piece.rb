class RedPiece < Piece
  def initialize
    super
    add_vertical_position( [ 1 , 1 ] )
  end

  def color
    :red
  end
  
  def size
    2
  end

  def has_stairs?
    false
  end
  
  
  
end
