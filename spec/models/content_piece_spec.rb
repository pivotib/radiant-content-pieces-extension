require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContentPiece do
  before do
    @content_piece = ContentPiece.instance
  end
  
  describe "@pieces" do
    it "should be an array" do
      @content_piece.pieces.class.should == Array
    end
    it "should allow new classes" do
      @content_piece.pieces << String
      @content_piece.pieces.should == [String]
    end
  end
end