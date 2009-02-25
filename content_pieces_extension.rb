# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ContentPiecesExtension < Radiant::Extension
  version "1.0"
  description "Add content to the website through the admin section"
  url "http://github.com/pivotib/radiant-content-pieces-extension/tree/master"
  
  define_routes do |map|
    map.namespace :admin do |admin|
      admin.resources :content_pieces
    end
  end
  
  def activate
    admin.tabs.add "Content Pieces", "/admin/content_pieces", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    admin.tabs.remove "Content Pieces"
  end
  
end