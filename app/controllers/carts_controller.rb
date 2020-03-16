class CartsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  	@cart_product = Cart.new
  	@cart_products = @product.cart_products
  end

  def create
  end

  def update
  end

  def destroy
  end
  
end
