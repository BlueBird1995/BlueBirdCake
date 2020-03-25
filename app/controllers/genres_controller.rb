class GenresController < ApplicationController
  
  def show
    @genres = Genre.all
    @product = Product.where(genre_id: params[:id])
  end

  def index
    @genres = Genre.all
  end
end
