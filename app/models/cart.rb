class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product

    def tax_included
    	price*1.1
    end


end
