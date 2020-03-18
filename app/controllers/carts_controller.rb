class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @carts = current_user.carts
    @total_price = 0
    @carts.each do |f|
    @total_price += f.subtotal
    end
  end

  def create
  	#@product = params[:cart][:product_id]
  	#@stock = params[:cart][:stock]
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
  	@cart = Cart.find(params[:user_id])
    @cart.destroy
    redirect_to request.referer
  end

  def destroy_all
    cart = Cart.destroy_all
    redirect_to request.referer
  end
  
  private

  def cart_params
    params.require(:cart).permit(:product_id,:stock,:user_id)
  end
end
