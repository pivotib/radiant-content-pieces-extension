class ContentPiece
  include Singleton
  include Enumerable
  
  def each
    pieces.each { |i| yield i }
  end
  
  def <<(piece)
    pieces << piece if !piece[:name].nil? && !piece[:path_method].nil?
    pieces
  end
  
  def size
    pieces.size
  end
  
  private
    def pieces
      @pieces ||= []
    end
end
