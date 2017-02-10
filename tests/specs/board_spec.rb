require_relative '../spec_helper'
VERTICAL = true
HORIZONTAL = false

describe Board do
  @disabled = false
  
  it "should be able to run the constructor" do
    board = Board.new
    board.should_not == nil
  end unless @disabled

  it "should nicely draw an empty board" do
    board = Board.new
    board.to_s.should_not == nil
    board.to_s.should == "000000\n000000\n000000\n000000\n000000\n"
  end unless @disabled

  it "should correctly place a vertical place a red piece" do
    board = Board.new
    red_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 0, 1 ).should == true
    board.has_piece_at?( 0, 2 ).should == false
    board.has_piece_at?( 1, 0 ).should == false
  end unless @disabled

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
  end unless @disabled

  
  it "should nicely draw a board with vertical piece" do
    board = Board.new
    red_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.to_s.should == "000000\n000000\n000000\n100000\n100000\n"
  end unless @disabled


  it "should nicely draw a vertical piece with a stair on the top" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, [1, '/'] ), 0, 0  )
    board.to_s.should == "000000\n000000\n000000\n\/00000\n100000\n"
    
  end unless @disabled


  it "should be able to add a horizontal piece" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == true
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 1, 0 ).should == true
    
    board.to_s.should == "000000\n000000\n000000\n000000\n1\/0000\n"
    
  end unless @disabled


  it "should not be able to double place a horizontal piece" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == true
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == false
    
    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 1, 0 ).should == true
    
    board.to_s.should == "000000\n000000\n000000\n000000\n1\/0000\n"
  end unless @disabled


  it "should not be able to overlay a horizontal piece on a vertical piece" do
    board = Board.new
    red_piece = RedPiece.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 0  ).should == false

    board.has_piece_at?( 0, 0 ).should == true
    board.has_piece_at?( 0, 1 ).should == true
    
  end unless @disabled


  it "should not be able to place a piece with nothing below it" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '/'] ), 0, 1  ).should == false
    
    board.has_piece_at?( 0, 1 ).should == false
    board.has_piece_at?( 1, 1 ).should == false
    
  end unless @disabled


  it "should not be able to place a piece with nothing below it with stairs on left" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, ['\\', 1] ), 0, 1  ).should == false
    
    board.has_piece_at?( 0, 1 ).should == false
    board.has_piece_at?( 1, 1 ).should == false
    
  end unless @disabled

  
  it "should not be able to place a three length piece with nothing below it" do
    board = Board.new
    green_piece = GreenPiece.new
    board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, ['\\', 1, 1] ), 0, 1  ).should == false

    board.has_piece_at?( 0, 1 ).should == false
    board.has_piece_at?( 1, 1 ).should == false
    board.has_piece_at?( 2, 1 ).should == false

    board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, [1, 1, '/'] ), 0, 1  ).should == false
    
  end unless @disabled


  it "should not be possible to place the stairs down" do
    board = Board.new
    blue_piece = BluePiece.new
    board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, ['\\', 1] ), 0, 0  ).should == false
    
    board.has_piece_at?( 0, 0 ).should == false
    board.has_piece_at?( 0, 1 ).should == false
    
  end unless @disabled


  it "should not allow pieces to be ext  end unless @disabled
ed off of either   end unless @disabled
" do
    board = Board.new
    green_piece = GreenPiece.new
    board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, ['\\', 1, 1] ), 5, 0  ).should == false
  end unless @disabled


  it "should be able to place a princess" do
    board = Board.new
    princess = Princess.new
    board.place_piece( princess, princess.positions.first, 0, 0 ).should == true
    board.to_s.should == "000000\n000000\n000000\n000000\nP00000\n"
    
  end unless @disabled


  it "should be able to place a knight" do
    board = Board.new
    knight = Knight.new
    board.place_piece( knight, knight.positions.first, 0, 0 ).should == true
    board.to_s.should == "000000\n000000\n000000\n000000\nK00000\n"
  
  end unless @disabled


  it "should be able to find the princess" do
    board = Board.new
    red_piece = RedPiece.new
    princess = Princess.new
    board.place_piece( red_piece, red_piece.positions.first, 0, 0 ).should == true
    board.place_piece( princess, princess.positions.first, 0, 2 ).should == true

    x, y = board.princess_location
    x.should == 0
    y.should == 2
  end unless @disabled


  it "should be able to find the knight" do
    board = Board.new
    red_piece = RedPiece.new
    knight = Knight.new
    board.place_piece( red_piece, red_piece.positions.first, 5, 0 ).should == true
    board.place_piece( knight, knight.positions.first, 5, 2 ).should == true

    x, y = board.knight_location
    x.should == 5
    y.should == 2
  end unless @disabled


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
    
  end unless @disabled


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
  end unless @disabled


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
    
  end unless @disabled

  

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
  end unless @disabled

  
  it "should be able to detect if the princess can reach the the knight with no pieces in between" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( knight, knight.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )

    expect( board.princess_can_reach_knight? ).to eq( true )
    
  end unless @disabled


  it "should be able to detect that the princess can't reach the knight" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new
    red_piece = RedPiece.new

    expect( board.place_piece( knight, knight.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 3, 0 ) ).to eq( true )

    expect( board.princess_can_reach_knight? ).to eq( false )
  end unless @disabled
  

  it "should bo able to handle level changes and detect if the princess can reach the knight" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new
    blue_piece = BluePiece.new
    orange_piece = OrangePiece.new

    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, ['/',1] ), 1, 0  ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 3, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 1 ) ).to eq( true )
    
    expect( board.princess_can_reach_knight? ).to eq( true )
  end unless @disabled

  
  it "should be able to detect that the princess can reach the knight if there are stairs in between" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new
    blue_piece = BluePiece.new
    orange_piece = OrangePiece.new

    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, ['/',1] ), 1, 0  ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, [1, '\\'] ), 3, 0  ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5,0 ) ).to eq( true )
    expect( board.princess_can_reach_knight? ).to eq( true )
  end unless @disabled

  

  it "should be able to find all the locations between the princess and the knight with no pieces in between" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( knight, knight.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )

    correct_solution = [[1, 0], [1, 1], [2, 0], [3, 0], [4, 0], [4, 1]]
    expect( board.locations_between_princess_and_knight ).to eq( correct_solution )
  end unless @disabled

  
  it "should be able to detect if the princess can reach the knight with pieces in between" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new
    red_piece = RedPiece.new

    expect( board.place_piece( knight, knight.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece, red_piece.positions.first, 3, 0 ) ).to eq( true )

    correct_solution = [[1, 0], [1, 1], [2, 0], [3, 2]]
    expect( board.locations_between_princess_and_knight ).to eq( correct_solution )
  end unless @disabled



  it "should be able to detect a complex layout where the princess can reach the knight" do
    board = Board.new

    knight = Knight.new
    princess = Princess.new
    blue_piece = BluePiece.new
    orange_piece = OrangePiece.new
    red_piece = RedPiece.new
    
    expect( board.place_piece( princess, princess.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, ['/',1] ), 1, 0  ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, [1, '/'] ), 3, 0  ) ).to eq( true )
    expect( board.place_piece( red_piece, Position.new( red_piece, VERTICAL, [1, 1] ), 4, 0  ) ).to eq( true )

    expect( board.place_piece( knight, knight.positions.first, 4,2 ) ).to eq( true )
    expect( board.princess_can_reach_knight? ).to eq( true )
  end unless @disabled


  it "should not be able to place something very very tall on to the board" do
    board = Board.new
    red_piece_one = RedPiece.new
    red_piece_two = RedPiece.new
    red_piece_three = RedPiece.new
    
    expect( board.place_piece( red_piece_one, red_piece_one.positions.first, 0, 0  ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first , 0, 2  ) ).to eq( true )
    expect( board.place_piece( red_piece_three, red_piece_three.positions.first, 0, 4  ) ).to eq( false )
  end unless @disabled

  it "should not be able to place a horizontal piece very very high" do
    board = Board.new

    blue_piece = BluePiece.new
    
    expect( board.place_piece( blue_piece, Position.new( blue_piece, HORIZONTAL, ['/',1] ), 0, 5  ) ).to eq( false )
  end unless @disabled

  it "should correctly balance green piece" do
    board = Board.new
    orange_piece = OrangePiece.new
    green_piece = GreenPiece.new
    
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, ['/', 1, 1] ), 2, 1  ) ).to eq( false )
    expect( board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, ['/', 1, 1] ), 1, 1  ) ).to eq( true )
  end unless @disabled

  it "should correctly detect that princess can reach knight in complex situation 1" do
    board = Board.new

    orange_piece = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    knight = Knight.new
    princess = Princess.new

    blue_piece = BluePiece.new
    green_piece = GreenPiece.new
    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, [ 1, 1, '\\'] ), 1, 1  ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, [ 1, '/'] ), 4, 0  ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )

    expect( board.princess_can_reach_knight? ).to eq( true )
  end unless @disabled

  it "should be able to detect that a valid spot includes balanceable spots" do
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

    found_location = false
    board.locations_between_princess_and_knight.each do|position|
      x,y = *position
      found_location = true if x == 1 && y == 1
    end

    expect( found_location ).to eq( true )
  end unless @disabled


  it "should detect when stairs are going the wrong way" do
    board = Board.new

    orange_piece = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new

    blue_piece = BluePiece.new
    green_piece = GreenPiece.new
    
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, [ 1, 1, '/'] ), 1, 1  ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, [ 1, '/'] ), 4, 0  ) ).to eq( true )

    expect( board.princess_can_reach_knight? ).to eq( false )
  end unless @disabled

  it "should detect when stairs are going the right way" do
    board = Board.new

    orange_piece = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new

    blue_piece = BluePiece.new
    green_piece = GreenPiece.new
    
    knight = Knight.new
    princess = Princess.new
    
    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece, orange_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 5, 0 ) ).to eq( true )
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 2 ) ).to eq( true )
    
    expect( board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, [ 1, 1, '\\'] ), 1, 1  ) ).to eq( true )
    expect( board.place_piece( blue_piece, Position.new( blue_piece, VERTICAL, [ 1, '/'] ), 4, 0  ) ).to eq( true )

    expect( board.princess_can_reach_knight? ).to eq( true )
    
  end unless @disabled

  it "should correctly determine that the princess can reach the knight for the solution on puzzle 47" do

    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new

    purple_piece = PurplePiece.new
    blue_piece_one = BluePiece.new
    blue_piece_two = BluePiece.new
    green_piece = GreenPiece.new
    
    knight = Knight.new
    princess = Princess.new

    expect( board.place_piece( red_piece, red_piece.positions.first, 0, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 4, 2 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 4, 3 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 2 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 4, 4 ) ).to eq( true )

    expect( board.place_piece( purple_piece, purple_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( green_piece, Position.new( green_piece, HORIZONTAL, [1, 1, '-'] ), 1, 1  ) ).to eq( true )
    expect( board.place_piece( blue_piece_one, Position.new( blue_piece_one, HORIZONTAL, [ '/', 1 ] ), 1, 2 ) ).to eq( true )
    expect( board.place_piece( blue_piece_one, Position.new( blue_piece_one, VERTICAL, [ 1, '/' ] ), 3, 2  ) ).to eq( true )

    expect( board.princess_can_reach_knight? ).to eq( true )
  end unless @disabled

  it "should correctly determine that the princess can reach the knight for the solution on puzzle 46" do
    board = Board.new

    orange_piece_one = OrangePiece.new
    orange_piece_two = OrangePiece.new
    red_piece = RedPiece.new
    red_piece_two = RedPiece.new
    
    knight = Knight.new
    princess = Princess.new

    purple_piece = PurplePiece.new
    blue_piece_one = BluePiece.new
    blue_piece_two = BluePiece.new
    
    expect( board.place_piece( red_piece, red_piece.positions.first, 5, 0 ) ).to eq( true )    
    expect( board.place_piece( red_piece_two, red_piece_two.positions.first, 4, 0 ) ).to eq( true )
    expect( board.place_piece( orange_piece_two, orange_piece_two.positions.first, 5, 2 ) ).to eq( true )
    expect( board.place_piece( orange_piece_one, orange_piece_one.positions.first, 0, 0 ) ).to eq( true )
    
    expect( board.place_piece( princess, princess.positions.first, 0, 1 ) ).to eq( true )
    expect( board.place_piece( knight, knight.positions.first, 5, 3 ) ).to eq( true )

    expect( board.place_piece( purple_piece, purple_piece.positions.first, 2, 0 ) ).to eq( true )
    expect( board.place_piece( blue_piece_one, Position.new( blue_piece_one, HORIZONTAL, [ '/', 1 ] ), 1, 1 ) ).to eq( true )

    expect( board.place_piece( blue_piece_two, Position.new( blue_piece_two, HORIZONTAL, [ '/', 1 ] ), 3, 2 ) ).to eq( true )
    
    expect( board.princess_can_reach_knight? ).to eq( true )
    
  end unless @disabled
  
  
end 

