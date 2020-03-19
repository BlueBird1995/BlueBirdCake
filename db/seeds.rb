# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!(
  genre_id: 1,
  product_image_id: 1,
  name: "hogehoge",
  price: 100,
  description: "hgoehogehogehogehogheohgoe",
  status: false
)

#初期のジャンル追加
Genre.create!(
    name: "焼き菓子",
    status: true
)
Genre.create!(
    name: "ケーキ",
    status: true
)
Genre.create!(
    name: "キャンデー",
    status: true
)
Genre.create!(
    name: "プリン",
    status: true
)