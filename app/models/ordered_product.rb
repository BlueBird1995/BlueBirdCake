class OrderedProduct < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :products, dependent: :destroy, optional: true
end
