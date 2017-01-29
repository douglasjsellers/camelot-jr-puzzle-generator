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
  def can_place_horizontal_piece?( piece, position, x, y )
    to_return = true
    (0..(piece.size - 1 ) ).each { |adder| to_return = false if( @raw_board_array[y][x + adder ] != 0 ) }

    to_return = confirm_horizontal_piece_is_balance( piece, position, x, y ) if to_return
    return to_return
  end

  def can_place_vertical_piece?( piece, position, x, y )
    to_return = true
    # first be sure that there is nothing that it is going to over write
    (0..(piece.size - 1 ) ).each { |adder| to_return = false if( @raw_board_array[y + adder ][x] != 0 ) }

    # now make sure it is balanced
    to_return = confirm_vertical_piece_is_stable( piece, position, x, y ) if to_return
    return to_return
  end
  
  def confirm_horizontal_piece_is_balance( piece, position, x, y )
    return confirm_vertical_piece_is_stable( piece, x, y ) if( piece.size == 1 )

    # find the starting and ending position of non-stairs
    offset = find_offset_closest_to_stair( piece, position )
    # make sure there is something solid under the position closest to the stair
    if( offset == 0 )
      return piece_below_location?( x, y )
    else
      return piece_below_location?( x + offset  - 1, y )
    end
  end

  # vertical is the easy case, we know that the width will always be 1 and there has to be a solid
  # brick below it
  def confirm_vertical_piece_is_stable( piece, position, x, y )
    if( position.layout[0] != 1 )
      return false
    else
      return piece_below_location?( x, y )
    end
  end
  
  def find_offset_closest_to_stair( piece, position )
    if( position.layout[0] != 1 )
      return 0
    elsif( position.layout[ piece.size - 1 ] != 1 )
      return piece.size - 1
    else
      return nil
    end
  end
   
 def place_vertical_piece( piece, position, x, y )
    if( can_place_vertical_piece?( piece, position, x, y ) )
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
    if( can_place_horizontal_piece?( piece, position, x, y ) )
      (0..(piece.size - 1 ) ).each do |adder|
        @raw_board_array[y][x + adder] = position.layout[adder]
      end
      @pieces << piece
      return true
    else
      return false
    end
    
  end

  def piece_below_location?( x, y )
    if( y > 0 )
      return @raw_board_array[ y - 1][x] == 1
    else
      return true
    end
  end
  
end
