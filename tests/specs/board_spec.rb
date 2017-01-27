require_relative '../spec_helper'

describe Board do
  it "should be able to run the constructor" do
    board = Board.new
    board.should_not == nil
  end
  
  
end
