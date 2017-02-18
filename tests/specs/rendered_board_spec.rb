require_relative '../spec_helper'

describe RenderedBoard do
  it "should be able to run the initializer" do
    expect( RenderedBoard.new( Board.new ) ).not_to eq( nil )
  end
  
end
