class Solution
  def initialize( board, playable_pieces )
    @board = board
    @playable_pieces = playable_pieces

    @solution = compute_solution( board, playable_pieces )
  end

  def has_solution?
    !@solution.nil?
  end

  def final_position_board
    @solution
  end
  
  private
  def compute_solution( current_board, current_pieces )
    if( current_board.princess_can_reach_knight? )
      return current_board
    else
      current_pieces.each do |current_piece|
        solution = add_piece_and_look_for_solution( current_board, current_piece, current_pieces - [current_piece] )
        return solution unless solution.nil?
      end
    end
    return nil
  end

  def add_piece_and_look_for_solution( board, piece, remaining_pieces )
    board.locations_between_princess_and_knight.each_with_index do |location, index|
      x, y = *location
      piece.positions.each do |position|
        current_board = board.clone
        if( current_board.place_piece( piece, position, x, y )  )
          if( remaining_pieces.empty? )
            return current_board if current_board.princess_can_reach_knight?
          else
            return add_piece_and_look_for_solution( current_board, remaining_pieces.first, remaining_pieces - [remaining_pieces.first] )
          end
        end
      end
    end
    return nil
  end
end

  
