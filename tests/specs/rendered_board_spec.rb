require_relative '../spec_helper'

describe RenderedBoard do
  @disabled = true

  it "should be able to generate a rendered file with all red pieces" do
    board = Board.new

    red_piece = RedPiece.new
    
    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 1, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 5, 0 ) ).to eq( true )

    rendered_board = RenderedBoard.new( board )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
    
  end
  
  it "should be able to generate a rendered file with a knight and a princess on it" do
    board = Board.new
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( knight, knight.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )

    rendered_board = RenderedBoard.new( board )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
  end unless @disabled

  
  it "should be able to generate a simple rendered file with a blank board" do
    rendered_board = RenderedBoard.new( Board.new )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
  end unless @disabled
  
  it "should be able to run the initializer" do
    expect( RenderedBoard.new( Board.new ) ).not_to eq( nil )
  end unless @disabled
  
end
