require 'rails_helper'

RSpec.describe "Evaluation", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user_id: @user.id)
    @evaluation = FactoryBot.build(:evaluation)
  end
  context "投稿できるとき" do
    it "正しい操作で投稿できる" do
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
      # NEW POSTをクリックしてEvaluation投稿画面へ遷移
      click_on 'NEW POST'
      # 遷移先パスを確認
      expect(current_path).to eq '/evaluations/new'
      # 各項目を入力する
      select(value = "2020", from: "evaluation[fiscal_year(1i)]") 
      select(value = "12", from: "evaluation[fiscal_year(2i)]") 
      fill_in "evaluation[goal]", with: @evaluation.goal
      # 送信するとプロフィールのデータカウントが1増えることを確認
      expect{
        find('input[class="submit"]').click
      }.to change { Evaluation.count }.by(1)
      # 送信後の遷移パスがトップページであることを確認
      expect(current_path).to eq root_path
    end
  end
  context "投稿できないとき" do
    it "誤った操作で投稿できない場合新規投稿画面が再度表示される" do
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
      # NEW POSTをクリックしてEvaluation投稿画面へ遷移
      click_on 'NEW POST'
      # 遷移先パスを確認
      expect(current_path).to eq '/evaluations/new'
      # 各項目を未入力
      fill_in "evaluation[goal]", with: ""
      # 未入力で送信してもプロフィールのデータカウントが増えないことを確認
      expect{
        find('input[class="submit"]').click
      }.to change { Evaluation.count }.by(0)
      # 送信後の遷移パスがトップページであることを確認
      expect(current_path).to eq '/evaluations'
      # エラーメッセージが表示されていることを確認
      expect(page).to have_content("翌期の目標は入力必須です。")
    end
  end
end

