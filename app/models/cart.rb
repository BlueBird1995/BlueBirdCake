class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product

	#商品の税込み単価
    def tax_included
    	(product.price*1.1).round
	end
	#商品ごとの小計
	def subtotal
		(product.price*stock*1.1).round
	end
	#カート商品の合計金額
	def total_price
		(product.price).sum
	end
end
