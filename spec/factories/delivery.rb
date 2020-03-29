FactoryBot.define do
    factory :delivery do
        name { '佐藤俊朗' }
        postal_code { '0000000' }
        address { 'テストテストテストテスト' }
        association :user
    end
end
