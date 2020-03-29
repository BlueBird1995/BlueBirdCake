require 'rails_helper'

RSpec.feature "管理者機能" , type: :feature do
  before do
    @admin = FactoryBot.create(:admin)
    FactoryBot.create(:genre)
  end

  scenario "管理者がジャンルを追加することができる" do
    #ログイン
    visit new_admin_session_path
    fill_in 'admin_email',    with: @admin.email
    fill_in 'admin_password', with: @admin.password
    click_on 'Log in'
    #管理者用トップページへ遷移
    expect(current_path).to eq admins_path

    #ヘッダーのジャンル一覧リンクをクリック
    click_link "ジャンル管理"
    expect(current_path).to eq admins_genres_path

    ##ジャンル登録
    fill_in 'genre_name', with: "ジャンル１"
    click_on "追加"
    #追加したジャンルが表示されている
    expect(page).to have_content 'ジャンル１'
  end

  scenario '管理者ユーザーがログアウトできる' do
    visit new_admin_session_path
    fill_in  'admin_email',    with: @admin.email
    fill_in  'admin_password', with: @admin.password
    click_on 'Log in'

    ###（想定外）ログアウトリンクがない
    click_on 'ログアウト'
    expect(current_path).to new_admin_session_path
  end
end