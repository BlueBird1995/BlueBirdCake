FactoryBot.define do
	factory :order do
		name { "Example User" }
		postal_code { "00000000" }
		address { "Example address" }
		payment { 0 }
		total_price { 100 }
		association :user
	end
end
