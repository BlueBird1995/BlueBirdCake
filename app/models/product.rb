class Product < ApplicationRecord
	has_many :carts, dependent: :destroy

    def tax_included
    	(product.price*1.1).round
    end

	def subtotal
		(product.price*stock*1.1).round
	end
end
