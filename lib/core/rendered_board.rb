class RenderedBoard
  def initialize( board )
    @board = board
  end

  def rendered_file( location )
    return render( location )
  end
  
  private
  def render( location )
    image = MiniMagick::Image.open("images/blank_challenge.png")
    image.format( 'png' )
    image.write( location  )
    return location
  end
  
end
