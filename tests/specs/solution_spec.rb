require_relative '../spec_helper'

describe Solution do
  it "should be able to find a solution to the simplest problem" do
    board = Board.new
    orange_piece = OrangePiece.new
    knight = Knight.new
    princess = Princess.new
    
    board.place_piece( orange_piece, orange_piece.positions.first, 5, 0 ).should == true
    board.place_piece( princess, princess.positions.first, 0, 0 ).should == true
    board.place_piece( knight, knight.positions.first, 5, 1 ).should == true
    
    solution = Solution.new( board, [BluePiece.new] )

    solution.has_solution?.should == true
    final_board = solution.final_position_board
    final_board.should_not == nil
  end
  
end
