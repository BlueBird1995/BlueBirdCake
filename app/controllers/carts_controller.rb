class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart_products = Cart.where(user_id: params[:id])
  end

  def create
  	@product = params[:cart][:product_id]
    @stock = params[:cart][:stock]
    @cart_product = Cart.new(cart_product_params)
    #@cart_product.user_id = current_user.id
    if @cart_product.save
      flash[:notice] = "Comment was successfully created."
      redirect_to user_carts_path(@cart_product)
    else
      redirect_to products_path(@product)
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

  def cart_product_params
    params.require(:cart).permit(:product_id, :stock, :user_id)
  end
end
