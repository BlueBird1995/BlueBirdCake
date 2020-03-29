require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品新規作成' do
    before do
      @genre = FactoryBot.create(:genre)
    end
    it '正しい内容が入力されている' do
      gerne = @genre
      product = Product.new(
        name: "ホゲホゲ",
        description: "ホゲホゲ",
        price: "100",
        status: "制作中",
        genre_id: 1,
      )
      expect(product).to be_valid
    end
  end

  describe '追加できない商品' do
    it '名前が入力されていない' do
      product = Product.new(name: nil)
      product.valid?
      expect(product.errors[:name]).to include("が入力されていません。")
    end

    it '値段が入力されていない' do
      product = Product.new(price: nil)
      product.valid?
      expect(product.errors[:price]).to include("が入力されていません。")
    end

    it '詳細が入力されていない' do
      product = Product.new(description: nil)
      product.valid?
      expect(product.errors[:description]).to include("が入力されていません。")
    end
  end
end