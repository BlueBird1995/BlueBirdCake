require 'rails_helper'

RSpec.feature "配送先" , type: :feature do
	background do
		@user = FactoryBot.create(:user)
		@product = FactoryBot.create(:product)
		sign_in @user
	end

	scenario '新しい配送先を追加できる' do
		visit user_path(@user)
		click_on '一覧を見る'
		expect(current_path).to eq user_deliveries_path(@user)

		fill_in "delivery_postal_code", with: "0000000"
		fill_in "delivery_address", with: "テスト県テスト市"
		fill_in "delivery_name", with: "テスト太郎"
		click_on '登録する'

		#反映されている
		expect(current_path).to eq user_deliveries_path(@user)
		expect(page).to have_content 'テスト太郎'
		expect(page).to have_content 'テスト県テスト市'
		expect(page).to have_content '0000000'
		expect(page).to have_content '編集する'
		expect(page).to have_content '削除する'
    end
end