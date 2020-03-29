FactoryBot.define do
    factory :cart do
        stock { '1' }
        association :user
        association :product
    end
end