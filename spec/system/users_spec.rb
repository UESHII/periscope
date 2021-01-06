require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context "ユーザー登録できるとき" do
    it "正しい操作で新規登録が完了する" do
      # ログインページへ遷移
      visit root_path
      # 新規登録ボタンを確認
      expect(page).to have_content('新規登録')
      # ボタンをクリックして登録画面へ遷移
      click_on('新規登録')
      # パスを確認
      expect(current_path).to eq new_user_registration_path
      # 各項目に入力する
      fill_in '名前', with: @user.name
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in '確認用パスワード', with: @user.password
      # 送信するとユーザーデータのカウントが1増えることを確認
      expect{
        find('input[class="submit"]').click
      }.to change { User.count }.by(1)
      # 送信後の遷移先パスを確認
      expect(current_path).to eq new_profile_path
    end
  end
  context 'ユーザー登録ができないとき' do
    it '誤った操作で新規登録画面が再表示される' do
      # ログインページへ遷移
      visit root_path
      # 新規登録ボタンを確認
      expect(page).to have_content('新規登録')
      # ボタンをクリックして登録画面へ遷移
      click_on('新規登録')
      # パスを確認
      expect(current_path).to eq new_user_registration_path
      # 各項目に入力する
      fill_in '名前', with: ""
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      fill_in '確認用パスワード', with: ""
      # 送信してもユーザーデータのカウントが増えないことを確認
      expect{
        find('input[class="submit"]').click
      }.to change { User.count }.by(0)
      # 送信後の遷移先パスを確認
      expect(current_path).to eq '/users'
    end
  end
end
