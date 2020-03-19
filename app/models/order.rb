class Order < ApplicationRecord

	belongs_to :user
	has_many :orderd_products, dependent: :destroy

	validates :payment, presence: true #支払方法のバリデ
	enum payment: {creditcard: 0, bank: 1} #クレジットカードと銀行振込を数値で管理

    def tax_included
    	(product.price*1.1).round
    end

    def subtotal
		(product.price*stock*1.1).round
	end
end
