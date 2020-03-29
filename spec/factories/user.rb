FactoryBot.define do
  factory :user do
    first_name { '佐藤' }
    last_name { '太郎' }
    first_kana { 'サトウ' }
    last_kana { 'タロウ' }
    postal_code { '00000000' }
    address { 'ホゲホゲホゲホゲ' }
    telephone_number { '00000000' }
    email { 'hogehoge@email.com' }
    password { 'hogehoge' }
    password_confirmation { 'hogehoge' }
  end
end
