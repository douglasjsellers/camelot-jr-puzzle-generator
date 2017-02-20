require_relative '../spec_helper'

describe Puzzle do
  it "should be able to run the constructor" do
    puzzle = Puzzle.new( [OrangePiece.new],[ BluePiece.new, BluePiece.new] )
    expect( puzzle.valid_boards.size).to eq( 2 )
  end

  
  
end
