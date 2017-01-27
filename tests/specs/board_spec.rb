require_relative '../spec_helper'

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
  



end
