require 'rails_helper'

RSpec.describe User, type: :model do
  describe '有効なユーザー' do
    it '全ての項目が入力されていれば有効' do
      user = User.new(
        first_name: "ホゲホゲ",
        last_name: "ホゲホゲ",
        first_kana: "ホゲホゲ",
        last_kana: "ホゲホゲ",
        email: "hogehoge@hoge",
        postal_code: "00000000",
        address: "ホゲホゲ",
        telephone_number: "00000000",
        password: "hogehoge",
        password_confirmation: "hogehoge",
      )
      expect(user).to be_valid
    end
  end

  describe '無効なユーザー' do
    it '苗字がなければ無効' do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("が入力されていません。")
    end

    it '名前がなければ無効' do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("が入力されていません。")
    end

    it 'カナ入力されてなければ無効' do
      user = User.new(first_kana: nil)
      user.valid?
      expect(user.errors[:first_kana]).to include("が入力されていません。")
    end

    it 'セイがなければ無効' do
      user = User.new(last_kana: nil)
      user.valid?
      expect(user.errors[:last_kana]).to include("が入力されていません。")
    end

    it 'メールアドレスがなければ無効' do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it '郵便番号が入力されていなければ無効' do
      user = User.new(postal_code: nil)
      user.valid?
      expect(user.errors[:postal_code]).to include("が入力されていません。")
    end

    it '電話番号が入力されていなければ無効' do
      user = User.new(telephone_number: nil)
      user.valid?
      expect(user.errors[:telephone_number]).to include("が入力されていません。")
    end

    it 'パスワードが入力されていなければ無効' do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
  end
end
