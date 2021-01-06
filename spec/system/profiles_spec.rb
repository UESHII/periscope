require 'rails_helper'

RSpec.describe "プロフィール登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.build(:profile)
  end
  context "プロフィール登録できるとき" do
    it "正しい操作で登録が完了する" do
      # ログインページへ遷移
      visit root_path
      # パスを確認
      expect(current_path).to eq new_user_session_path
      # 各項目に入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # 送信する
      click_on 'ログイン'
      # 送信後の遷移先パスを確認
      expect(current_path).to eq '/profiles/new'
      # 各項目を入力する
      fill_in "profile[contact]", with: "test contact info"
      find("option[value='1']").select_option
      fill_in "profile[joining_date]", with: Date.new(2021, 1, 6)
      # 送信するとプロフィールのデータカウントが1増えることを確認
      expect{
        find('input[class="submit"]').click
      }.to change { Profile.count }.by(1)
      # 送信後の遷移パスがトップページであることを確認
      expect(current_path).to eq root_path
    end
  end
  context "プロフィール登録できないとき" do
    it "誤った操作で登録できない場合プロフィール登録画面が再度表示される" do
      # ログインページへ遷移
      visit root_path
      # パスを確認
      expect(current_path).to eq new_user_session_path
      # 各項目に入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # 送信する
      click_on 'ログイン'
      # 送信後の遷移先パスを確認
      expect(current_path).to eq '/profiles/new'
      # 各項目を未入力
      fill_in "profile[contact]", with: ""
      fill_in "profile[joining_date]", with: ""
      # 送信してもプロフィールのデータカウントが増えないことを確認
      expect{
        find('input[class="submit"]').click
      }.to change { Profile.count }.by(0)
      # 送信後のパスがプロフィール登録画面であることを確認
      expect(current_path).to eq '/profiles'
      # エラーメッセージが表示されていることを確認
      expect(page).to have_content("所属チームは入力必須です。")
      expect(page).to have_content("連絡先情報は入力必須です。")
      expect(page).to have_content("入社日は入力必須です。")
    end
  end
end

