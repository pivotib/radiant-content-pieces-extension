class Admin::ContentPiecesController < ApplicationController
  def index
    @content_pieces = ContentPiece.instance
    @content_pieces.sort_by { |p| p[:name] }
  end
end