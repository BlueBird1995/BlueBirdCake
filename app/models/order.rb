class Order < ApplicationRecord

	belongs_to :user
	has_many :orderd_products, dependent: :destroy

	enum payment: [ :creditcard, :bank ] #クレジットカードと銀行振込
end
