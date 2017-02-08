class BluePiece < Piece
  def initialize
    super
    add_both_horizontal_and_vertical_position( [ 1, '/' ] )
    add_both_horizontal_and_vertical_position( [ 1, '\\' ] )
    add_horizontial_position( [ '\\', 1 ] )
    add_horizontial_position( [ '/', 1 ] )
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
