class OrderedProduct < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, dependent: :destroy, optional: true
end
