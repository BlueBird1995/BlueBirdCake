FactoryBot.define do
  factory :product do
    name { '商品A' }
    price { '100' }
    description { 'ホゲホゲホゲホゲホゲホゲホゲホゲ' }
    association :genre
  end
end

#create_table "products", force: :cascade do |t|
#  t.string "product_image_id"
#  t.integer "price", null: false
#  t.text "description", null: false
#  t.boolean "status", default: true, null: false
#  t.string "name", null: false
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#end
