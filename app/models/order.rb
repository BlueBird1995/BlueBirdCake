class Order < ApplicationRecord

	belongs_to :user
	has_many :orderd_products, dependent: :destroy

	validates :payment, presence: true #支払方法のバリデ
	enum payment: {creditcard: 0, bank: 1} #クレジットカードと銀行振込を数値で管理

end
