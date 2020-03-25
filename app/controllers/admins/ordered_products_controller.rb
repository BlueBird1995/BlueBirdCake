class Admins::OrderedProductsController < ApplicationController
  before_action :authenticate_admin!
  
	def update #製作ステータスの更新
		@ordered_product = OrderedProduct.find(params[:id])
		@ordered_product.update(ordered_product_params)
		redirect_back(fallback_location: root_path)
    end

private
 def ordered_product_params
   params.require(:ordered_product).permit(:status)
 end

end
