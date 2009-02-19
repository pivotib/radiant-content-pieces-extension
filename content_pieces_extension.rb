# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ContentPiecesExtension < Radiant::Extension
  version "1.0"
  description "Add content to the website through the admin section"
  url "http://pivotib.com/ib_point"
  
  # define_routes do |map|
  #   map.connect 'admin/site_content/:action', :controller => 'admin/site_content'
  # end
  
  def activate
     admin.tabs.add "Content Pieces", "/admin/content_pieces", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
     admin.tabs.remove "Content Pieces"
  end
  
end