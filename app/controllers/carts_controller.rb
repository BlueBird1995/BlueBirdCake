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
    @cart = Cart.new(cart_params)
    @user = User.find(params[:user_id])
    @findcart = current_user.carts

    if @findcart.find_by(product_id: params[:cart][:product_id]).present?
      # もし、クリックされた商品のIDがカートモデルに存在していたら数量を増やすだけのコード
      @cart = Cart.find_by(product_id: params[:cart][:product_id],user_id: params[:user_id])
      # 商品IDが送られてきた値と同一、かつユーザーIDが送られてきたIDと同一のもの（唯一のカート）を特定
      @cart.stock += params[:cart][:stock].to_i
      # そのカートのストックに、送られてきた追加したい文を加算する（データを整数値に直しています）
      @cart.save
      # whereで探すと配列として結果が出てsaveできないので、find_byを使いました。
      redirect_to user_carts_path(@user)
    else
    @cart.save
      redirect_to user_carts_path(@user)
    end
  end


  def update
    @cart = Cart.find_by(product_id: params[:cart][:product_id],user_id: params[:user_id])
    @cart.stock = params[:cart][:stock]
    @cart.save
    redirect_to user_carts_path
  end

  def destroy
  	@cart = Cart.find(params[:user_id])
    @cart.destroy
    redirect_to request.referer
  end

#カートを空にする
  def destroy_all
    @carts = current_user.carts
    @carts.destroy_all
    redirect_to request.referer
  end
  
  private
  def cart_params
    params.require(:cart).permit(:product_id,:stock,:user_id)
  end
end
