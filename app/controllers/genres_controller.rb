class GenresController < ApplicationController
  
  def show
    @genres = Genre.all
    @product = Product.where(genre_id: params[:id])
  end

  # 共通テンプレートように作ったが入らなかった
  def index
    @genres = Genre.all
  end
end
