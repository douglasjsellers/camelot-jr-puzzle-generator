# Camelot Jr Puzzle Generator

Have your childern played the awesome board game [Camelot Jr.](http://www.smartgames.eu/en/smartgames/camelot-jr)?  Have you been frustrated with the limited number of puzzles that it comes with?  This is a simple way to generate a whole new set of Camelot Jr puzzles and solutions - complete with images.  If you run it with all the available configurations 4772 puzzles and solutions will be generated.  If you are looking for a curated book of an additional 62 puzzles here is a link to a pdf with some of the better [puzzles](../master/solutions/the-hard-puzzles.pdf).

## Usage

Basic usage is as follows:
* Create a new Puzzle with the puzzle pieces that you want and the available solving pieces
* Grab the valid solutions
* Render the board out to a nice image

```
  puzzle = Puzzle.new( [OrangePiece.new], [PurplePiece.new, BluePiece.new, BluePiece.new] )
  puzzle.valid_solutions.each do |valid_solution|
    rendered_starting_position = RenderedBoard.new( valid_solution.board, [PurplePiece.new, BluePiece.new, BluePiece.new] )
    rendered_solution_position = RenderedBoard.new( valid_solution.solution )

    rendered_starting_position.rendered_file( "puzzle.png" )
    rendered_solution_position.rendered_file( "solution.png" )
  end                                         
```

Good examples of the usage can be seen in bin/scenario_*.rb.



