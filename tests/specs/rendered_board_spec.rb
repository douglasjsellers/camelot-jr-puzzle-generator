require_relative '../spec_helper'

describe RenderedBoard do
  it "should be able to run the initializer" do
    expect( RenderedBoard.new( Board.new ) ).not_to eq( nil )
  end

  it "should be able to generate a simple rendered file with a blank board" do
    rendered_board = RenderedBoard.new( Board.new )
    file = rendered_board.rendered_file( 'result.png' ) 
    expect( file ).not_to eq( nil )
  end
  
  
end
