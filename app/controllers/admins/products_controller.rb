class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
    @genres = Genre.all
  end

  def edit
  	@product = Product.find(params[:id])
  	@genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    @product.genre_id = params[:product][:genre][:genre_id]
    if @product.save
    redirect_to admins_products_path
    else
    @genres = Genre.all 
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
