require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContentPiece do
  before do
    @content_piece = ContentPiece.instance
    @content_piece.clear
  end
  
  it "should be a singleton" do
    lambda { ContentPiece.instance }.should_not raise_error
  end
  
  describe "<< method" do
    it "should be able to add a piece" do
      lambda {
        @content_piece << valid_hash
      }.should change(@content_piece, :size).by(1)
    end
  
    it "should allow a hash with a name" do
      lambda { @content_piece << valid_hash(:name => "foo") }.should change(@content_piece, :size).by(1)
    end
    it "should not allow a hash without a name" do
      lambda { @content_piece << valid_hash(:name => nil) }.should_not change(@content_piece, :size)
    end

    it "should allow a hash with a path_method" do
      lambda { @content_piece << valid_hash(:path_method => "foo") }.should change(@content_piece, :size).by(1)
    end
    it "should not allow a hash without a path_method" do
      lambda { @content_piece << valid_hash(:path_method => nil) }.should_not change(@content_piece, :size)
    end
  end
  
  describe "while enumerating" do
    before do
      @content_piece << valid_hash(:name => "foo") << valid_hash(:name => "baz")
    end
    it "should be able to enumerate over the object" do
      lambda{ @content_piece.each{|piece| } }.should_not raise_error
    end
    it "should be able to map :name" do
      @content_piece.map{|p| p[:name] }.should == ["foo", "baz"]
    end
  end

  protected
  def valid_hash(options={})
    { :name => "foo", :path_method => 'bar' }.merge(options)
  end
end