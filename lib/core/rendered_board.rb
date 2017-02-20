class RenderedBoard
  PIECE_SPACING_IN_HEADER = 150
  HEADER_STARTING_POSITION = 50
  HEADER_SPACING = 75
  
  def initialize( board, solution_pieces = [] )
    @board = board
    @solution_pieces = solution_pieces
  end

  def rendered_file( location )
    return render( location )
  end
  
  private

  def add_solution_header_if_appropriate( background_image )
    current_header_y = HEADER_STARTING_POSITION
    @solution_pieces.each_slice( 2 ).to_a.reverse.each do |row|
      images = row.collect { |piece| MiniMagick::Image.open( map_piece_to_image_name( piece ) ) }
      total_width = images.inject( 0 ) { |sum, image| sum + image.width } + PIECE_SPACING_IN_HEADER
      offset = ( background_image.width - total_width ) / 2
      images.each do | image |
        background_image = background_image.composite( image ) do |c|
          c.compose "Over"                    
          c.geometry( "+#{offset}+#{current_header_y}" )
          offset += (image.width + PIECE_SPACING_IN_HEADER)
        end
      end
      current_header_y += HEADER_SPACING + 194
    end
    background_image
  end
  
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
      piece_image.rotate placed_piece.position.rotation.to_s if placed_piece.position != 0      
      piece_image.flip if placed_piece.position.mirror
      image = image.composite( piece_image ) do |c|
        c.compose "Over"
        y_position  = 1076 - 194*(placed_piece.y + (piece_height( placed_piece ) - 1 ))
        x_position = 125+(placed_piece.x * 194 )
        
        c.geometry( "+#{x_position}+#{y_position}" )
      end
    end
    image = add_solution_header_if_appropriate( image ) unless @solution_pieces.empty?
    image.format( 'png' )
    image.write( location  )
    return location
  end
  
end
