require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::ContentPiecesController do
  dataset :users
  before do
    login_as :existing
    @content_pieces = ContentPiece.instance
    @content_pieces << valid_hash << valid_hash(:name => "baz")
    ContentPiece.stub!(:instance).and_return(@content_pieces)
  end

  describe "index method" do
    it "should create a @content_pieces instance" do
      ContentPiece.should_receive(:instance).and_return(@content_pieces)
      get "index"
    end
    
    it "should sort_by name on @content_pieces" do
      sorted = @content_pieces.sort_by{ |p| p[:name] }
      @content_pieces.should_receive(:sort_by).and_return(sorted)
      get "index"
    end
  end
  protected
  def valid_hash(options={})
    { :name => "foo", :path_method => 'bar' }.merge(options)
  end
end