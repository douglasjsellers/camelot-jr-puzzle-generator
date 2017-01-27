class Board
  def initialize
    @raw_board_array = [[0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0]]
    @pieces = []
  end

  def has_piece_at?( x, y )
    @raw_board_array[y][x] == 1
  end
  
  def place_piece( piece, position, x, y )
    if( position.height > position.width )
      place_vertical_piece( piece, x, y )
    else
      place_horizontal_piece( piece, x, y )
    end
  end

  def valid_board?
  end

  def to_s
    string_to_return = ""
    @raw_board_array.reverse.each do |row|
      row.each do |column|
        string_to_return << column.to_s
      end
      string_to_return << "\n"
      
    end
    
    string_to_return
  end
  
  private
  def place_vertical_piece( piece, x, y )
    (0..(piece.size - 1 ) ).each do |adder|
       @raw_board_array[y + adder ][x] = 1
    end
    @pieces << piece
    return true
  end

  def place_horizontal_piece( piece, x, y )
  end
  
  
end
