class Product < ApplicationRecord
	has_many :carts, dependent: :destroy

    def tax_included
    	(price*1.1).round
    end
end
