require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'カートに商品を追加できる' do
    before do
      @user = FactoryBot.create(:user)
      @prodcut = FactoryBot.create(:product)
    end

    it '商品を追加' do
      user = @user
      prodcut = @prodcut
      cart = Cart.new(
        user_id: 1,
        product_id: 1,
        stock: 1,
      )
      expect(cart).to be_valid
    end
  end
end
