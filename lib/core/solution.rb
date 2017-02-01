class Solution
  def initialize( board, playable_pieces )
    @board = board
    @playable_pieces = playable_pieces

    compute_solution
  end

  private
  def compute_solution( current_board, current_pieces )

    princess_x, princess_y = current_board.princess_location
    knight_x, knight_y = current_board.knight_location

    if( current_board.princess_next_to_knight? )
      return current_board
    else
      # Try to advance the princess forward a step
      new_board = current_board.clone
      pieces_outer = current_pieces.clone


      pieces_outer.each_with_index do |piece, index|
        new_board = current_board.clone
        new_board.add(piece)
        pieces_inner = current_pieces.clone - [piece]
        pieces_inner.each do |current_piece|
          
        end
      end
    end
  end


  
end

  
