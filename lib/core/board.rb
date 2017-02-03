class Board
 
  def initialize
    @raw_board_array = [[0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0],
                       [0,0,0,0,0,0]]
    @pieces = []
  end

  def clone
    Marshal::load(Marshal.dump(self))    
  end
  
  def has_princess?
    x, y = princess_location
    return !x.nil? && !y.nil?
  end

  def has_knight?
    x, y = knight_location
    return !x.nil? && !y.nil?
    
  end
  
  def has_piece_at?( x, y )
    @raw_board_array[y][x] != 0
  end


  def height_of_column( x )
    (@raw_board_array.size - 1).downto(0) do |y|
      return y+1 if has_piece_at?( x, y )
    end

    return 0
  end
  
  def knight_location
    location_of_item( 'K' )    
  end
  
  def locations_between_princess_and_knight
    to_return = []
    princess_x, princess_y = self.princess_location
    knight_x, knight_y = self.knight_location
    ((princess_x + 1)..(knight_x - 1 )).each do |x_location|
      to_return << [x_location, self.height_of_column( x_location )]
    end
    to_return
  end
  
  def place_piece( piece, position, x, y )
    if( position.height > position.width )
      place_vertical_piece( piece, position, x, y )
    else
      place_horizontal_piece( piece, position, x, y )
    end
  end

  def princess_can_reach_knight?
    princess_x, princess_y = self.princess_location
    knight_x, knight_y = self.knight_location
    ((princess_x + 1)..(knight_x - 1 )).each do |x_location|
      top_of_column = self.height_of_column( x_location )
      top_of_column_character = @raw_board_array[self.height_of_column( x_location ) - 1][x_location]
      if ((top_of_column == (princess_y + 1)) && (top_of_column_character == '/' ))
        princess_y = princess_y + 1
      elsif ((top_of_column == (princess_y - 1)) && (top_of_column_character == '\\' ))
        princess_y = princess_y - 1
      elsif( top_of_column == princess_y  )        
      else
        return false
      end
    end

    return ( princess_y == knight_y )
  end
  
  def princess_location
    location_of_item( 'P' )
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

  def location_of_item( item )
    x = nil
    y = nil
    @raw_board_array.each_with_index do |row, row_number|
      row.each_with_index do |column, column_number|
        if( column == item )
          x = column_number
          y = row_number
        end
      end
    end

    return x,y
    
  end
  
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
    return confirm_vertical_piece_is_stable( piece, position, x, y ) if( piece.size == 1 )

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
  def is_solid_piece_at_bottom?( piece, position )
    return position.layout[0] == 1 || position.layout[0] == 'K' || position.layout[0] == 'P'
  end
  
  def confirm_vertical_piece_is_stable( piece, position, x, y )
    if( !is_solid_piece_at_bottom?( piece, position ) )
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
