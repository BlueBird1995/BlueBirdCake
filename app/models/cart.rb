class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product


	#商品の税込み単価
    def tax_included
    	(product.price*1.1).round
	end

 #小計
  def subtotal
		(product.price*stock*1.1).round
	end

	def total_stock
		(product.stock).sum
	end

end
