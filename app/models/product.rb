class Product < ApplicationRecord
	has_many :carts, dependent: :destroy
	belongs_to :ordered_product
    def tax_included
    	(price*1.1).round
    end

    attachment :product_image

    belongs_to :genre
end
