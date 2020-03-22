class OrderedProduct < ApplicationRecord
	belongs_to :order
	has_many :products, dependent: :destroy

end
