class PlacedPiece
  attr_reader :position, :piece, :x, :y
  def initialize( position, piece, x, y )
    @position = position
    @piece = piece
    @x = x
    @y = y
  end
end
