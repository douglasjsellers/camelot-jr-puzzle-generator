class Piece
  def initialize
    @positions = []
    @vertical = true
    @horizontal = false
  end

  def add_both_horizontal_and_vertical_position( layout )
    add_horizontial_position( layout )
    add_vertical_position( layout )
    self
  end
  
  def add_horizontial_position( layout, mirror = false )
    @positions << Position.new( self, @horizontal, layout, mirror )
    self
  end

  def add_vertical_position( layout, mirror = false )
    @positions << Position.new( self, @vertical, layout, mirror )
    self
  end

  def color
    :black
  end
  
  def positions
    @positions
  end

  def size
    throw "Please implement"
  end

  def has_stairs?
  end
  
  
  
end
