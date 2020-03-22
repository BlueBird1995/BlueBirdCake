class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page], per_page: 8)
  end

  def show
  	@product = Product.find(params[:id])
  	@cart = Cart.new
  	@user = current_user
  end

end
