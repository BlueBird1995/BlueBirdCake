class Admins::OrdersController < ApplicationController

	def top #今日の注文件数を表示
		@orders = Order.all
		@orders.each do |order|
			if (order[:created_at].to_s.match(/#{Date.today.to_s}.+/))
				@order_total =  @order.sum(:id)
			end
		end
	end

	def index #注文一覧画面を表示
		@orders = Order.all.order(created_at: :desc)
		@carts = Cart.all
	end

	def show #注文の詳細を確認する
		@order = Order.find(params[:id])
		@ordered_products = @order.ordered_products
	end

	def update #注文ステータスの更新
		@order = Order.find(params[:id])
		@order.update(order_params)
	end

private
 def order_params
   params.permit(:status)
 end
end
