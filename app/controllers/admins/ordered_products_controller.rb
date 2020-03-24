class Admins::OrderedProductsController < ApplicationController

	def update #製作ステータスの更新
		@ordered_product = OrderedProduct.find(params[:id])
		@ordered_product.update(ordered_product_params)
    end

private
 def ordered_product_params
   params.require(:ordered_product).permit(:status)
 end

end
