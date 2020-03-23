class ProductsController < ApplicationController
  def index
  	@products = Product.all.page(params[:page]).per(4)
  	@genres = Genre.all
    # ジャンルの表示
  end

  def show
  	@product = Product.find(params[:id])
  	@cart = Cart.new
    @user = current_user
    
    @genres = Genre.all
    # ジャンルの表示
  end

end
