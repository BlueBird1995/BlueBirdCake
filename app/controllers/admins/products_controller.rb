class Admins::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.naw
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to
  end

  def update
  	product = Product(params[:id])
  	product.update(product_params)
  	redirect_to
  end

  def destroy
  end

  private
  def product_params
  	params.require(:product).permit(:product_image,:name,:description,:genre_id,:price,:status)
  end

end
