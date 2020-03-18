class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @carts = current_user.carts
    @cart_items = @carts.group(:product_id).
  end

  def create
    @cart = Cart.new(cart_params)
    @user = User.find(params[:user_id])
    if @cart.save
      redirect_to user_carts_path(@user)
    else
      redirect_to product_path(@product)
    end
  end

  def update
  end

  def destroy
  	@cart_product = CartProduct.find(params[:product_id])
    @cart_product.destroy
    redirect_to request.referer
  end

  private
  def cart_params
    params.require(:cart).permit(:product_id,:stock,:user_id)
  end
end
