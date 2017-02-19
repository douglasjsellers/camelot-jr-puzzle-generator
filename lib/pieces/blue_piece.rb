class BluePiece < Piece
  def initialize
    super
    add_vertical_position( [ 1, '/' ], 90 )
    add_vertical_position( [ 1, '\\' ], true, 90 )
    
    add_horizontial_position( [ 1, '-' ], false, 180 )
    add_horizontial_position( [ '-', 1], true )
    
    add_horizontial_position( [ 1, '\\'], true, 180 )
    add_horizontial_position( [ '/', 1 ]  )
  end

  def color
    :blue
  end
  
  def size
    2
  end

  def has_stairs?
    true
  end
end  
