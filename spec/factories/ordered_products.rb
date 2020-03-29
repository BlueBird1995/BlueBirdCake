FactoryBot.define do
	factory :ordered_product do
		price { 100 }
		stock { 1 }
		association :product
		association :order
	end
end