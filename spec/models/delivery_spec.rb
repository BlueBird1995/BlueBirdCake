require 'rails_helper'

RSpec.describe Delivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '有効な配送先' do
    it '全ての項目に正しい情報を入力している' do
      user = @user
      delivery = Delivery.new(
        name: "佐藤太郎",
        postal_code: "0000000",
        address: "東京都埼玉県",
        user_id: 1,
      )
      expect(delivery).to be_valid
    end
  end

  describe '無効な配送先' do
    it '名前を入力していない' do
      user = @user
      delivery = Delivery.new(name: nil)
      delivery.valid?
      expect(delivery.errors[:name]).to include('が入力されていません。')
    end

    it '郵便番号を入力していない' do
      user = @user
      delivery = Delivery.new(postal_code: nil)
      delivery.valid?
      expect(delivery.errors[:postal_code]).to include('が入力されていません。')
    end

    it '住所を入力していない' do
      user = @user
      delivery = Delivery.new(address: nil)
      delivery.valid?
      expect(delivery.errors[:address]).to include('が入力されていません。')
    end
  end
end
