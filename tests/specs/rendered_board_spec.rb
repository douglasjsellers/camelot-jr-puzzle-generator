require_relative '../spec_helper'
VERTICAL = true
HORIZONTAL = false

describe RenderedBoard do
  @disabled = true

  it "should correctly render a solution" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 5, 0 ) ).to eq( true )    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new, PurplePiece.new, BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board

    rendered_board = RenderedBoard.new( final_board )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
  end 
  
  it "should correctly render something with all of the pieces on it" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 5, 0 ) ).to eq( true )    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    rendered_board = RenderedBoard.new( board )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
    
  end unless @disabled
  
  it "should correctly mirror and rotate an image" do
    board = Board.new

    blue_piece = BluePiece.new
    expect( board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'], true, 180 ), 1, 0  ) ).to eq( true )

    rendered_board = RenderedBoard.new( board )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
  end unless @disabled

  
  it "should be able to stack a orange on top of a red" do
    board = Board.new
    red_piece = RedPiece.new
    orange_piece = OrangePiece.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 0, 2 ) ).to eq( true )

    rendered_board = RenderedBoard.new( board )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
    
  end unless @disabled
  
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
    
  end unless @disabled
  
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
