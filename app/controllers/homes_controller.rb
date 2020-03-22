class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @products = Product.first(4)
  end
end
