class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
  	#@product = Product.find(params[:id])
    #@cart_product = CartProduct.new
  	#@cart_products = @product.cart_products
  end

  def create
  	@product = params[:cart][:product_id]
  	@stock = params[:cart][:stock]
    @cart_product = @product.cart_product.new(cart_product_params)
    @cart_product.user_id = current_user.id
    if @cart_product.save
      #flash[:success] = "Comment was successfully created."
      redirect_to carts_path(@cart_product)
    else
      render '/carts/show'
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
    params.require(:cart_product).permit(:cart)
  end
end
