class RenderedBoard
  def initialize( board )
    @board = board
    @column_height = [1270, 1270, 1270, 1270, 1270, 1270]
  end

  def rendered_file( location )
    return render( location )
  end
  
  private

  def map_piece_to_image_name( piece )
    "images/" + ((piece.class.to_s.split /(?=[A-Z])/).join( "_" ) + ".png").downcase
  end
  
  def render( location )
    image = MiniMagick::Image.open("images/blank_challenge.png")
    @board.placed_pieces.each do |placed_piece|
      image_name = map_piece_to_image_name( placed_piece.piece )
      piece_image = MiniMagick::Image.open(image_name)
      image = image.composite( piece_image ) do |c|
        c.compose "Over"
        @column_height[placed_piece.x] = @column_height[placed_piece.x] - piece_image.height
        c.geometry( "+#{125+(placed_piece.x * 194 )}+#{@column_height[placed_piece.x]}" )
      end
    end
    image.format( 'png' )
    image.write( location  )
    return location
  end
  
end
