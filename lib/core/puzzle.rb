class Puzzle
  attr_reader :valid_boards
  def initialize( puzzle_pieces, solving_pieces )
    @puzzle_pieces = puzzle_pieces + [Knight.new, Princess.new]
    @solving_pieces = solving_pieces
    @valid_boards = []

    compute_valid_boards
  end

  private
  def add_next_piece_to_board( board, used_pieces, unused_pieces )
    if( unused_pieces.empty? )
      solution = Solution.new( board, @solving_pieces )
      @valid_boards << board if solution.has_solution?
    else
      piece = unused_pieces.first
      valid_positions = board.placeable_positions
      valid_positions.each do |position|
        position_board = board.clone
        x, y = *position
        position_board.place_piece( piece, piece.positions.first, x, y )
        add_next_piece_to_board( position_board, used_pieces + [piece], unused_pieces - [piece] )
      end
    end
    
  end
  
  def compute_valid_boards
    add_next_piece_to_board( Board.new, [], @puzzle_pieces )
  end
  
  
end

