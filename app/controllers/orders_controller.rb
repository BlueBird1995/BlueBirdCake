class OrdersController < ApplicationController

  def new #注文者情報を入力する
    @order = Order.new
    @order.user_id = current_user.id
    @user = current_user
  end

  def confirm #注文確認画面を表示する
    @order = Order.new(order_params)
    if params[:address_button] == "my_address" #ご自身の住所
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
      @order.name = current_user.name
     elsif params[:address_button] == "deliveries_address" #保存してある住所
      @order.postal_code = Delivery.find(params[:select]).postal_code
      @order.address = Delivery.find(params[:select]).address
      @order.name = Delivery.find(params[:select]).name
    end
  end

  def create #注文情報を作成する
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_success_path
    else
      @order = Order.new
      @order.user_id = current_user.id
      @user = current_user
      render :new
    end
  end

  def success #完了画面を表示する（お礼）
  end

  def index #注文履歴一覧を表示する
    @orders = Order.all.order(created_at: :desc)
  end

  def show #注文履歴詳細を表示する
    @order = Order.find(params[:id])
  end


private
 def order_params
   params.require(:order).permit( :user_id, :name, :postal_code, :address, :payment, :total_price, :postage, :status)
 end
end