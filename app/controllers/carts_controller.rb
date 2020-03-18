class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.carts
    @carts = Cart.all
    @total_price = @carts.sum(:subtotal)
  end

  def create
  	@product = params[:cart][:product_id]
  	@stock = params[:cart][:stock]
    @cart = Cart.new(cart_params)
    #@cart.user_id = current_user.id
    if @cart.save
      #flash[:success] = "Comment was successfully created."
      redirect_to user_carts_path(@cart)
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
