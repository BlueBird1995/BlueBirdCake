require 'rails_helper'

RSpec.feature "商品購入機能" , type: :feature do
  #ユーザー作成、ログイン、
  background do
    @user = FactoryBot.create(:user)
    sign_in @user
    @product = FactoryBot.create(:genre)
    FactoryBot.create(:product, name: '商品A', description: 'ホゲホゲ')
    FactoryBot.create(:delivery, user_id: @user.id )
  end

  scenario 'topページから商品詳細ページへ行ける' do
    visit root_path
    click_on 'Image'

    expect(current_path).to eq product_path(@product)
    expect(page).to have_content '商品A'
    expect(page).to have_content 'ホゲホゲ'
    expect(page).to have_content '110円'
  end

  scenario 'カートの商品の数量を変更することができる' do
    visit root_path
    click_on 'Image'

    #カート追加機能
    select '1', from: 'cart[stock]'
    click_on 'カートに入れる'
    expect(page).to have_content '商品A'

    #カート内商品更新
    fill_in 'cart_stock', with: '3'
    click_on '変更'
    expect(page).to have_content '3'
  end
end
