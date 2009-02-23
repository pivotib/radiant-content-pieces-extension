class Admin::ContentPieceController < ApplicationController
  def index
    @content_piece = ContentPiece.instance
  end
end