# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ContentPiecesExtension < Radiant::Extension
  version "1.0"
  description "Add content to the website through the admin section"
  url "http://pivotib.com/ib_point"
  
  @content_piece = ContentPiece.instance
  #@content_piece.pieces = Array.new if @content_piece.pieces.empty?
  @content_piece.pieces << 'Files'
  
  define_routes do |map|
    map.with_options(:controller => 'admin/content_piece') do |content_piece|
      content_piece.content_piece_index 'admin/content_pieces', :action => 'index'
    end
    
    # map.resources
    # map.connect 'admin/content_pieces/:action', :controller => 'admin/content_pieces_controller'
  end
  
  def activate
     admin.tabs.add "Content Pieces", "/admin/content_pieces", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
     admin.tabs.remove "Content Pieces"
  end
  
end