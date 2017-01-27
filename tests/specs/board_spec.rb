require_relative '../spec_helper'

describe Board do
  it "should be able to run the constructor" do
    board = Board.new
    board.should_not == nil
  end

  it "should nicely draw an empty board" do
    board = Board.new
    board.to_s.should_not == nil
    puts board.to_s    
  end
  
end
