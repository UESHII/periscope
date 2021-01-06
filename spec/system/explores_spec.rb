require 'rails_helper'

RSpec.describe "Explores", type: :system do
  before do
    # 1人目のユーザーデータ
    @user =       FactoryBot.create(:user)
    @profile =    FactoryBot.create(:profile, user_id: @user.id)
    # 2人目のユーザーデータ
    @user2 =      FactoryBot.create(:user)
    @profile2 =   FactoryBot.create(:profile, user_id: @user2.id)
  end
  context "検索できるとき" do
    it "正しい操作で検索できる" do
      # ログインページへ遷移
      visit root_path
      # パスを確認
      expect(current_path).to eq new_user_session_path
      # 各項目に入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # 送信する
      click_on 'ログイン'
      # 送信後の遷移先がトップページであることを確認
      expect(current_path).to eq root_path
      # EXPLOREリンクをクリックして検索画面へ遷移
      click_on "EXPLORE"
      # 遷移先パスを確認
      expect(current_path).to eq "/explores"
      # 各項目を入力する
      fill_in "q[name_cont]", with: @user2.name
      find("option[value='#{@profile2.team_id}']").select_option
      fill_in "q[profile_joining_date_gteq]", with: Date.new(2000, 1, 1)
      fill_in "q[profile_joining_date_lteq_end_of_day]", with: Date.today
      # 送信する
      click_on '検索'
      # 遷移先のパスを確認する
      expect(current_path).to include("/explores/search")
      # 2人目のユーザー情報が表示されていることを確認
      expect(page).to have_content(@user2.name)
    end
  end
end