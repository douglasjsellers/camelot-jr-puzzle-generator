class OrangePiece < Piece
  def initialize
    super
    add_vertical_position( [ 1 ] )
  end

  def color
    :yellow
  end
  
  def size
    1
  end

  def has_stairs?
    false
  end
  
  
  
end
