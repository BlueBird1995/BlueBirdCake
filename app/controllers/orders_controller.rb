class OrdersController < ApplicationController

  def new #注文者情報を入力する
    @order = Order.new
    # 追記
    @order.user_id = current_user.id
    @user = current_user
  end
  
  #def confirm #注文確認画面を表示する
 #   @order = Order.new(order_params)
    #if params[:address_button] == "my_address" #ご自身の住所選んだら
     # @order.address = current_user.full_address
    #elsif params[:address_button] == "deliveries_address" #登録済住所から選択を選んだら
     # @order.address = current_user.deliveries.find(セレクトタグ)
      #@order.address = address.full_address
    #else
     # @order.addressエラー処理
      #render :new
    #end
  
  if params[:address_button] == "deliveries_address" #保存してある住所を選んだ場合
      @order.address = Delivery.find(params[:select]).full_address #モデルに定義した住所を合体させるメソッド
    else 
      redirect_to root_path
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
    @orders = Order.all
  end

  def show #注文履歴詳細を表示する
    @order = Order.find(params[:id])
  end


private
 def order_params
   params.require(:order).permit( :user_id, :name, :postal_code, :address, :payment,
                                     :total_price, :postage, :status, :creditcard, :bank)
  end
end

