class Knight < Piece
  def initialize
    super
    add_vertical_position( [ 'K' ] )
  end

  def color
    :cyan
  end
  
  def size
    1
  end

  def has_stairs?
    false
  end
  
  
end
