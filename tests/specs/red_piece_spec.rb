require_relative '../spec_helper'

describe RedPiece do
  it "should be able to run the constructor" do
    red_piece = RedPiece.new
    red_piece.should_not == nil
  end

  it "should only have one position" do
    red_piece = RedPiece.new
    red_piece.positions.length.should == 1
  end
  
end
