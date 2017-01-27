class RedPiece < Piece
  def positions
    [ Position.new( self, 2, 1, nil ) ]
  end

  def size
    2
  end

  def has_stairs?
    false
  end
  
  
  
end
