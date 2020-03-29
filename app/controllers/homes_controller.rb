class HomesController < ApplicationController
  def top
    @genres = Genre.all
    # おすすめ商品を４つだけ表示している、５個くらいでもいいかも？
    @products = Product.first(4)
  end
end
