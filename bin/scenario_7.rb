require_relative '../lib/cjpg.rb'

puzzle_pieces = [OrangePiece.new, RedPiece.new]

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

counter = 0
solving_piece_combinations.each do |solving_piece_combination|
  puzzle = Puzzle.new( puzzle_pieces, solving_piece_combination )
  puzzle.valid_solutions.each do |valid_solution|
    rendered_starting_position = RenderedBoard.new( valid_solution.board, solving_piece_combination )
    rendered_solution_position = RenderedBoard.new( valid_solution.solution )

    rendered_starting_position.rendered_file( "solutions/scenario7/puzzle_#{counter}.png" )
    rendered_solution_position.rendered_file( "solutions/scenario7/solution_#{counter}.png" )
    puts "Found solution #{counter}"
    counter += 1
  end
end



