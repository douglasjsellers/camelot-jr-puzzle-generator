class Board
  def initialize
    @raw_board_array = [[0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0]]
  end
  
  def place_piece( piece, location )
    
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
  
  
end
