class Board
  def initialize
    @raw_board_array = [[0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0]]
    @pieces = []
  end

  def has_piece_at?( x, y )
    @raw_board_array[y][x] != 0
  end
  
  def place_piece( piece, position, x, y )
    if( position.height > position.width )
      place_vertical_piece( piece, position, x, y )
    else
      place_horizontal_piece( piece, position, x, y )
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
  def can_place_vertical_piece?( piece, x, y )
    to_return = true
    (0..(piece.size - 1 ) ).each { |adder| to_return = false if( @raw_board_array[y + adder ][x] != 0 ) }
    return to_return
  end
  
  def place_vertical_piece( piece, position, x, y )
    if( can_place_vertical_piece?( piece, x, y ) )
      (0..(piece.size - 1 ) ).each do |adder|
        @raw_board_array[y + adder ][x] = position.layout[adder]
      end
      @pieces << piece
      return true
    else
      return false
    end
  end

  def place_horizontal_piece( piece, position, x, y )
    (0..(piece.size - 1 ) ).each do |adder|
      @raw_board_array[y][x + adder] = position.layout[adder]
    end
    @pieces << piece
    return true
  end
  
  
end
