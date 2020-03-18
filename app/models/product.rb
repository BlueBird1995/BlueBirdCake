class Product < ApplicationRecord
	has_many :carts, dependent: :destroy, through: :carts
end
