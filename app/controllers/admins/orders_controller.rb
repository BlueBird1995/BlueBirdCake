class Admins::OrdersController < ApplicationController

	def top #今日の注文件数を表示
		@orders = Order.all
		if @orders.where([:created_at].to_s.match(/#{Date.today.to_s}.+/)).present?
			@data = @orders.where([:created_at].to_s.match(/#{Date.today.to_s}.+/)).count
		else
			@data = "注文なし！"
		end
    end

	def index #注文一覧画面を表示
		@orders = Order.all.order(created_at: :desc)
	end

	def show
		@order = Order.find(params[:id])
		@ordered_products = OrderedProduct.where(order_id: params[:id])
	end

	def update #注文ステータスの更新
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_back(fallback_location: root_path)
	end

private
 def order_params
   params.require(:order).permit(:status,
								 ordered_products_attributes: [:status] )
 end
end
