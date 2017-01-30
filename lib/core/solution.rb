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

      if( new_board.can_move_princess_right? )
        new_board.move_princess_right
        return compute_solution( new_board )
      else
        # Start iterating through the existing position pieces and trying to place them
        # See if one of them makes it so that the princess can move right
        # If so, move forward, otherwise try again
        new_board = place_new_piece_to_allow_princess_to_move_forward( new_board, current_pieces )
        if( new_board.can_move_princess_right? )
          new_board.move_princess_right?
          return compute_solution( new_board )
        else
          return nil
        end
      end
    end
  end

  def place_new_piece_to_allow_princess_to_move_forward( board, current_pieces )
  end
  
  
end

  
