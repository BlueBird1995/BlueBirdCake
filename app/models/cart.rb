class Cart < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :stock, numericality: { only_integer: true,	greater_than: 0, less_than: 10}

	validates :stock, :numericality => { :less_than => 10 }


	#商品の税込み単価
    def tax_included
    	(product.price*1.1).round
	end

 #小計
  def subtotal
		(product.price*stock*1.1).round
	end

	def total_stock
		(product.stock).sum
	end

end
