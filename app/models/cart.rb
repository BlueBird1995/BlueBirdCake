class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product

	def total_price
		(product.price*stock*1.1).round
	end
end
