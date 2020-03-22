class Order < ApplicationRecord
	belongs_to :user
	has_many :ordered_products, dependent: :destroy
	accepts_nested_attributes_for :ordered_products

	validates :payment, presence: true #支払方法のバリデ
	enum payment: {creditcard: 0, bank: 1} #クレジットカードと銀行振込を数値で管理

    def tax_included
    	(product.price*1.1).round
    end

    def subtotal
		(product.price*stock*1.1).round
	end
end
