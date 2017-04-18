class PlacedPiece
  attr_reader :position, :piece, :x, :y, :length
  def initialize( position, piece, x, y )
    @position = position
    @piece = piece
    @x = x
    @y = y
    @length = @piece.size
  end
end
