class CartsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  	@cart_product = CartProduct.new
  	@cart_products = @product.cart_products
  end

  def create
  	@product = Product.find(params[:product_id])
    @product_new = Product.new
    @cart_product = @product.cart_product.new(cart_product_comment_params)
    @cart_product.user_id = current_user.id
    if @cart_product.save
      flash[:success] = "Comment was successfully created."
      redirect_to book_path(@book)
    else
      @book_comments = BookComment.where(book_id: @book.id)
      render '/books/show'
    end
  end

  def update
  end

  def destroy
  end
  
end
