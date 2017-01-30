class Princess < Piece
  def initialize
    super
    add_vertical_position( [ 'P' ] )
  end

  def size
    1
  end

  def has_stairs?
    false
  end
  
  
end
