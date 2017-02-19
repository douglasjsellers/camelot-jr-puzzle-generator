class GreenPiece < Piece
  def initialize
    super
    add_horizontial_position( [ '/', 1, 1 ] )
    add_horizontial_position( [ '-', 1, 1 ], true )
    add_vertical_position( [ 1, 1, '\\' ], true, 90 )
    add_vertical_position( [ 1, 1, '/' ], false, 90 )
    add_horizontial_position( [ 1, 1, '\\' ], true, 180 )        
    add_horizontial_position( [ 1, 1, '-' ], false, 180 )
    
  end

  def color
    :green
  end
  
  def size
    3
  end

  def has_stairs?
    true
  end
end  
