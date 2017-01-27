require_relative '../spec_helper'

describe Position do
  it "should be able to run the constructor" do
    red_piece = RedPiece.new
    position = Position.new( red_piece, 2, 1, nil )
    position.piece.should == red_piece
    position.height.should == 2
    position.width.should == 1
    position.stair_location.should == nil
  end
  
end

