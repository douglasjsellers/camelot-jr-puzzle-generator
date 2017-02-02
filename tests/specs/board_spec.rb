require_relative '../spec_helper'
VERTICAL = true
HORIZONTAL = false

describe Board do 
  it "should be able to run the constructor" do
    board = Board.new
    board.should_not == nil
  end

  it "should nicely draw an empty board" do
    board = Board.new
    board.to_s.should_not == nil
    board.to_s.should == "000000\n000000\n000000\n000000\n"
  end

  it "should correctly place a vertical place a red piece" do
    board = Board.new
    red_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 0, 1 ).should == true
    board.has_piece_at?( 0, 2 ).should == false
    board.has_piece_at?( 1, 0 ).should == false
  end

  it "should not be able to place one red piece on top of the other red piece" do
    board = Board.new
    red_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 0, 1 ).should == true

    second_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == false
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 0, 1 ).should == true
  end
  
  it "should nicely draw a board with vertical piece" do
    board = Board.new
    red_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.to_s.should == "000000\n000000\n100000\n100000\n"
  end

  it "should nicely draw a vertical piece with a stair on the top" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, [1, '/'] ), 0, 0  )
    board.to_s.should == "000000\n000000\n\/00000\n100000\n"
    
  end

  it "should be able to add a horizontal piece" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == true
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 1, 0 ).should == true
    
    board.to_s.should == "000000\n000000\n000000\n1\/0000\n"
    
  end

  it "should not be able to double place a horizontal piece" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == true
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == false
    
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 1, 0 ).should == true
    
    board.to_s.should == "000000\n000000\n000000\n1\/0000\n"
  end

  it "should not be able to overlay a horizontal piece on a vertical piece" do
    board = Board.new
    red_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == false

    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 0, 1 ).should == true
    
  end

  it "should not be able to place a piece with nothing below it" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 1  ).should == false
    
    board.has_piece_at?( 0, 1 ).should == false
    board.has_piece_at?( 1, 1 ).should == false
    
  end

  it "should not be able to place a piece with nothing below it with stairs on left" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, ['\\', 1] ), 0, 1  ).should == false
    
    board.has_piece_at?( 0, 1 ).should == false
    board.has_piece_at?( 1, 1 ).should == false
    
  end
  
  it "should not be able to place a three length piece with nothing below it" do
    board = Board.new
    green_piece = GreenPiece.new
    board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, ['\\', 1, 1] ), 0, 1  ).should == false

    board.has_piece_at?( 0, 1 ).should == false
    board.has_piece_at?( 1, 1 ).should == false
    board.has_piece_at?( 2, 1 ).should == false

    board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, [1, 1, '/'] ), 0, 1  ).should == false
    
  end

  it "should not be possible to place the stairs down" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, ['\\', 1] ), 0, 0  ).should == false
    
    board.has_piece_at?( 0, 0 ).should == false
    board.has_piece_at?( 0, 1 ).should == false
    
  end

  it "should not allow pieces to be extended off of either end" do
    board = Board.new
    green_piece = GreenPiece.new
    board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, ['\\', 1, 1] ), 5, 0  ).should == false
  end

  it "should be able to place a princess" do
    board = Board.new
    princess = Princess.new
    board.place_piece( princess, princess.positions.first, 0, 0 ).should == true
    board.to_s.should == "000000\n000000\n000000\nP00000\n"
    
  end

  it "should be able to place a knight" do
    board = Board.new
    knight = Knight.new
    board.place_piece( knight, knight.positions.first, 0, 0 ).should == true
    board.to_s.should == "000000\n000000\n000000\nK00000\n"
  
  end

  it "should be able to find the princess" do
    board = Board.new
    red_piece = RedPiece.new
    princess = Princess.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.place_piece( princess, princess.positions.first, 0, 2 ).should == true

    x, y = board.princess_location
    x.should == 0
    y.should == 2
  end

  it "should be able to find the knight" do
    board = Board.new
    red_piece = RedPiece.new
    knight = Knight.new
    board.place_piece( red_piece, red_piece.positions.first, 5, 0 ).should == true
    board.place_piece( knight, knight.positions.first, 5, 2 ).should == true

    x, y = board.knight_location
    x.should == 5
    y.should == 2
  end

  it "should be able to find both the princess ande the knight" do
    board = Board.new
    red_piece = RedPiece.new
    knight = Knight.new
    board.place_piece( red_piece, red_piece.positions.first, 5, 0 ).should == true
    board.place_piece( knight, knight.positions.first, 5, 2 ).should == true
    
    princess = Princess.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.place_piece( princess, princess.positions.first, 0, 2 ).should == true

    x, y = board.knight_location
    x.should == 5
    y.should == 2

    x, y = board.princess_location
    x.should == 0
    y.should == 2
    
  end

  it "should be able to determine if there is a knight" do
    board = Board.new
    red_piece = RedPiece.new
    
    board.has_knight?.should == false
    knight = Knight.new
    princess = Princess.new
    board.place_piece( princess, princess.positions.first, 0, 0 ).should == true
    board.has_knight?.should == false
    
    board.place_piece( red_piece, red_piece.positions.first, 5, 0 ).should == true
    board.place_piece( knight, knight.positions.first, 5, 2 ).should == true

    board.has_knight?.should == true
  end

  it "should be able to deterime if there is a princess" do
    board = Board.new
    red_piece = RedPiece.new
    
    board.has_princess?.should == false
    knight = Knight.new
    princess = Princess.new
    
    board.place_piece( red_piece, red_piece.positions.first, 5, 0 ).should == true
    board.place_piece( knight, knight.positions.first, 5, 2 ).should == true
    board.has_princess?.should == false
    
    board.place_piece( princess, princess.positions.first, 0, 0 ).should == true
    board.has_princess?.should == true
    
  end
  

  it "should be possible to make a distinct clone" do
    board = Board.new
    red_piece = RedPiece.new
    
    expect( board.has_princess? ).to eq(false)
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( red_piece, red_piece.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    cloned_board = board.clone

    expect( cloned_board.to_s ).to eq( board.to_s )

    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( cloned_board.to_s ).not_to eq( board.to_s )
  end

  it "should be able to find all the locations between the princess and the knight" do
    
  end


  it "should be able to detect if the princess can reach the the knight with no pieces in between" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( knight, knight.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )

    correct_solution = [[1,0],[2,0],[3,0],[4,0]]
    expect( board.locations_between_princess_and_knight ).to eq( correct_solution )
  end
  
  
end
