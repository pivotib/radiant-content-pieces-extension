class ContentPiece
  include Singleton
  attr_accessor :pieces
  def initialize
    @pieces = []
  end
  
  def pieces
    @pieces
  end
end