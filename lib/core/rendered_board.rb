class RenderedBoard
  def initialize( board )
    @board = board
  end

  def rendered_file( location )
    return render( location )
  end
  
  private

  def map_piece_to_image_name( piece )
    "images/" + ((piece.class.to_s.split /(?=[A-Z])/).join( "_" ) + ".png").downcase
  end

  def piece_height( placed_piece )
    placed_piece.position.height
  end
  
  
  def render( location )
    image = MiniMagick::Image.open("images/blank_challenge.png")
    @board.placed_pieces.each do |placed_piece|
      image_name = map_piece_to_image_name( placed_piece.piece )
      piece_image = MiniMagick::Image.open(image_name)
      piece_image.flip if placed_piece.position.mirror
      piece_image.rotate placed_piece.position.rotation.to_s if placed_piece.position != 0
      image = image.composite( piece_image ) do |c|
        c.compose "Over"
        y_position  = 1076 - 194*(placed_piece.y + (piece_height( placed_piece ) - 1 ))
        x_position = 125+(placed_piece.x * 194 )
        
        c.geometry( "+#{x_position}+#{y_position}" )
      end
    end
    image.format( 'png' )
    image.write( location  )
    return location
  end
  
end
