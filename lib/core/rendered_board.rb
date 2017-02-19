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
  
  def render( location )
    image = MiniMagick::Image.open("images/blank_challenge.png")
    @board.positions.each do |position|
      image_name = map_piece_to_image_name( position.piece )
      piece_image = MiniMagick::Image.open(image_name)
      image = image.composite( piece_image ) do |c|
        c.compose "Over"
        c.geometry( "+125+#{1270-piece_image.height}" )
      end
    end
    
    image.format( 'png' )
    image.write( location  )
    return location
  end
  
end
