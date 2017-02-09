class GreenPiece < Piece
  def initialize
    super
    add_both_horizontal_and_vertical_position( [ 1, 1, '\\' ] )    
    add_vertical_position( [ 1, 1, '/' ] )
    add_horizontial_position( [ 1, 1, '-' ] )
    add_horizontial_position( [ '-', 1, 1 ] )
    add_horizontial_position( [ '/', 1, 1 ] )
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
