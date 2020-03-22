class OrderedProduct < ApplicationRecord
	belongs_to :order, optional: true
	has_many :products, dependent: :destroy
end
