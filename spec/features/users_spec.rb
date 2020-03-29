require "rails_helper"

RSpec.feature "ユーザー管理機能" , type: :feature do
  feature "会員登録" do
    background do
      @user = FactoryBot.create(:user)
    end

    scenario '会員情報を編集することができる' do
        sign_in @user
        visit user_path(@user)
        click_on '編集する'

        #全項目変更
        fill_in "user_first_name",         with: "変更"
        fill_in "user_last_name",          with: "健太"
        fill_in "user_first_kana",         with: "ヘンコウ"
        fill_in "user_last_kana",          with: "ケンタ"
        fill_in "user_email",              with: "change@email.com"
        fill_in "user_postal_code",        with: "12345678"
        fill_in "user_address",            with: "変更町"
        fill_in "user_telephone_number",   with: "123456789"
        click_on '編集内容を保存する'

        #変更内容が保存されている
        expect(current_path).to eq user_path(@user)
        expect(page).to have_content '変更'
        expect(page).to have_content '健太'
        expect(page).to have_content 'ヘンコウ'
        expect(page).to have_content 'ケンタ'
        expect(page).to have_content 'change@email.com'
        expect(page).to have_content '12345678'
        expect(page).to have_content '変更町'
        expect(page).to have_content '123456789'
    end

    scenario 'ログイン後ヘッダーのレイアウト変更' do
      sign_in @user
      visit root_path

      expect(page).to have_link 'マイページ'
      expect(page).to have_link '商品一覧'
      expect(page).to have_link 'カート'
      expect(page).to have_link 'ログアウト'
    end

    scenario '退会することができる' do
        @admin = FactoryBot.create(:admin)
        sign_in @user

        visit user_path(@user)
        click_on '編集する'
        expect(current_path).to eq edit_user_path(@user)

        click_on '退会する'
        expect(current_path).to eq confirm_destroy_user_path(@user)

        click_on '退会する'
        expect(current_path).to eq root_path
        #ログアウトされている
        expect(page).to have_content 'ログイン'

        #ログインできない
        click_on 'ログイン'
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_on 'commit'
        expect(current_path).to eq new_user_session_path

        #管理者側で退会の確認する
        visit new_admin_session_path
        fill_in 'admin_email', with: @admin.email
        fill_in 'admin_password', with: @admin.password
        click_on 'commit'
        expect(current_path).to eq admins_path

        click_on '会員一覧'
        expect(current_path).to eq admins_users_path

        expect(page).to have_content '退会済'
    end
  end
end
