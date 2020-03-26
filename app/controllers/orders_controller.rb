class OrdersController < ApplicationController
  before_action :not_null_cart, only: [:confirm, :new]
  before_action :authenticate_user!

  def new #注文者情報を入力する
    # test
    @order = Order.new
    @order.user_id = current_user.id
    @user = current_user
  end

  def confirm
    @order = Order.new(order_params)
    @order.ordered_products.build
    @carts = current_user.carts
    if params[:address_button] == "my_address" #ご自身の住所
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
      @order.name = current_user.name
    elsif params[:address_button] == "deliveries_address" #保存してある住所
      @order.postal_code = Delivery.find(params[:select]).postal_code
      @order.address = Delivery.find(params[:select]).address
      @order.name = Delivery.find(params[:select]).name
    end

    @cart = current_user.carts
    @total_stock = @cart.sum(:stock)

    @total_price = 0
    @carts.each do |f|
      @total_price += f.subtotal
    end
    @postage_total_price = @total_price + 800
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @carts = current_user.carts
      @carts.destroy_all
      redirect_to orders_success_path
    else
      @order.user_id = current_user.id
      @user = current_user
      render :new
    end
  end

  def success
  end

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = OrderedProduct.all
    @carts = current_user.carts
    @total_price = 0
    @carts.each do |f|
      @total_price += f.subtotal
    end
    @postage_total_price = @total_price + 800
  end


  private
    def order_params
      params.require(:order).permit(  :user_id,
                                      :name,
                                      :postal_code,
                                      :address,
                                      :payment,
                                      :total_price,
                                      :postage,
                                      :status,
                                      ordered_products_attributes: [:price, :stock, :product_id])
    end

    #カートがNullであればredirect_back
    def not_null_cart
      flash.now[:alert] = "カートに商品を入れてください"
      redirect_back(fallback_location: root_path) if current_user.carts.empty?
    end

    #送られてきた配送情報が空ならリダイレクトさせる
end
