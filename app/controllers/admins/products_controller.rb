class Admins::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    if product.save
    redirect_to admins_products_path
    else
    render :new
    end
  end

  def update
  	product = Product.find(params[:id])
  	if product.update(product_params)
  	redirect_to admins_products_path
    else
    render :edit
    end
  end

  private
  def product_params
  	params.require(:product).permit(:product_image,:name,:description,:genre_id,:price,:status)
  end

end
