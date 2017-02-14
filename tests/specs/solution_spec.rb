require_relative '../spec_helper'

describe Solution do
  @disabled = true

  it "should be able to solve classic puzzle 28" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [BluePiece.new, BluePiece.new, GreenPiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )

  end unless @disabled
  
  it "should be able to solve classic puzzle 29" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 4, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )

  end unless @disabled
  
  
  it "should be able to solve classic puzzel 30" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new
    
    orange_piece_one = OrangePiece.new
    
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 5, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 1 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new, BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
    
  end unless @disabled
  

  it "should be able to solve classic puzzle 31" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 3, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new, PurplePiece.new, BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )

  end unless @disabled
  
  it "should be able to solve classic puzzle 32" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 4, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 3 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new, PurplePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled
  
  it "should be able to solve classic puzzle 33" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 1, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new,  BluePiece.new, PurplePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled
  
  it "should be able to solve classic puzzle 34" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 5, 2 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new,  BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled
  

  it "should be able to solve classic puzzle 35" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 3, 0 ) ).to eq( true )

    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new,  BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
    
  end unless @disabled
  
  it "should be able to solve classic puzzle 36" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new,  BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )

  end unless @disabled
  
  it "should be able to solve classic puzzle 37" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )    
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new,  BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )

  end unless @disabled
  
  it "should be able to solve classic puzzle 38" do
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
    expect( final_board ).not_to eq( nil )
  end unless @disabled
  
  it "should be able to find a solution to the simplest problem" do
    board = Board.new
    orange_piece = OrangePiece.new
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 1 ) ).to eq( true )
    
    solution = Solution.new( board, [BluePiece.new] )

    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve a find a two piece solution" do
    board = Board.new
    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 2, 0 ) ).to eq( true )
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 4, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 1 ) ).to eq( true )
    
    solution = Solution.new( board, [BluePiece.new, BluePiece.new] )
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve a three piece solution" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 2, 0 ) ).to eq( true )

    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )
    
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 4, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 3 ) ).to eq( true )

    solution = Solution.new( board, [BluePiece.new, BluePiece.new, PurplePiece.new] )
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled
  
  it "should be able to solve a two piece solution (2)" do
    board = Board.new

    orange_piece = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [BluePiece.new, GreenPiece.new ] )
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve a one piece solution that requires upside down green" do
    board = Board.new

    orange_piece = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 2 ) ).to eq( true )

    
    solution = Solution.new( board, [ GreenPiece.new ] )
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
    
  end unless @disabled
  
  it "should be able to solve classic puzzle 48" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )    
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 2 ) ).to eq( true )


    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 3 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new, BluePiece.new, BluePiece.new, PurplePiece.new] )
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve classic puzzle 47" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 4, 2 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 4, 3 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 4 ) ).to eq( true )
    
    solution = Solution.new( board, [GreenPiece.new, BluePiece.new, BluePiece.new, PurplePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve classic puzzle 46" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 5, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 5, 2 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    solution = Solution.new( board, [BluePiece.new, BluePiece.new, PurplePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve classic puzzle 45" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 3, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [BluePiece.new, BluePiece.new, GreenPiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve classic puzzle 44" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 3, 1 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [PurplePiece.new, BluePiece.new, GreenPiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled

  it "should be able to solve classic puzzle 43" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    solution = Solution.new( board, [PurplePiece.new, BluePiece.new, GreenPiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled


  it "should be able to solve classic puzzle 42" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 1, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 4, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 3 ) ).to eq( true )

    solution = Solution.new( board, [PurplePiece.new, BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )

  end unless @disabled


  it "should be able to solve classic puzzle 41" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 2, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new, BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled


  it "should be able to solve classic puzzle 40" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 5, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 1 ) ).to eq( true )

    solution = Solution.new( board, [PurplePiece.new, BluePiece.new, GreenPiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )
  end unless @disabled
  
  it "should be able to solve classic puzzle 41" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 3, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    solution = Solution.new( board, [GreenPiece.new, BluePiece.new, BluePiece.new] )
    
    expect( solution.has_solution? ).to eq( true )
    final_board = solution.final_position_board
    expect( final_board ).not_to eq( nil )

  end unless @disabled
  

  
end
