class Puzzle
  attr_reader :valid_solutions
  def initialize( puzzle_pieces, solving_pieces )
    @puzzle_pieces = puzzle_pieces + [Knight.new, Princess.new]
    @solving_pieces = solving_pieces
    @valid_solutions = []

    compute_valid_solutions
  end

  def self.find_all_boards
    puzzle_piece_combinations = [
      [OrangePiece.new],
      [OrangePiece.new, OrangePiece.new],
      [OrangePiece.new, OrangePiece.new, RedPiece.new],
      [OrangePiece.new, OrangePiece.new, RedPiece.new, RedPiece.new],
      [OrangePiece.new, RedPiece.new, RedPiece.new],
      [RedPiece.new, RedPiece.new],
      [OrangePiece.new, RedPiece.new]
    ]

    solving_piece_combinations = [
      [PurplePiece.new],
      [PurplePiece.new, BluePiece.new],
      [PurplePiece.new, BluePiece.new, BluePiece.new],
      [PurplePiece.new, BluePiece.new, BluePiece.new, GreenPiece.new],
      [PurplePiece.new, BluePiece.new, GreenPiece.new],
      [PurplePiece.new, GreenPiece.new],
      [BluePiece.new, BluePiece.new, GreenPiece.new],      
      [BluePiece.new, GreenPiece.new],
      [BluePiece.new, BluePiece.new],
      [GreenPiece.new]
    ]

    puzzle_piece_combinations.each do |puzzle_piece_combination|
      solving_piece_combinations.each do |solving_piece_combination|
        puzzle = Puzzle.new( puzzle_piece_combination,solving_piece_combination )
        puzzle.valid_solutions.each do |valid_board|
          puts ""
          puts valid_board.colored_string
        end
      end
    end
  end
  
  private
  def add_next_piece_to_board( board, used_pieces, unused_pieces )
    if( unused_pieces.empty? )
      solution = Solution.new( board, @solving_pieces )
      @valid_solutions << solution if solution.has_solution?
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
  
  def compute_valid_solutions
    add_next_piece_to_board( Board.new, [], @puzzle_pieces )
  end
  
  
end

