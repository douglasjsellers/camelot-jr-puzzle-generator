require_relative '../spec_helper'

describe Solution do
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
    expect ( final_board ).not_to eq( nil )
  end
  
end
