class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product

    def tax_included
    	(product.price*1.1).round
    end

    def subtotal
		(product.price*stock*1.1).round
	end

    def total_price
    	(product.price).sum
    end


end
