require 'rails_helper'

RSpec.describe "Review", type: :system do
  before do
    # 1人目のユーザーデータ
    @user =       FactoryBot.create(:user)
    @profile =    FactoryBot.create(:profile, user_id: @user.id)
    # 2人目のユーザーデータ
    @user2 =      FactoryBot.create(:user)
    @profile2 =   FactoryBot.create(:profile, user_id: @user2.id)
    @evaluation = FactoryBot.create(:evaluation, user_id: @user2.id)
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
      # 未レビューの投稿が表示されていることを確認
      expect(page).to have_link('詳細', href: "/evaluations/#{@evaluation.id}")
      # クリックして上記投稿詳細画面へ遷移
      click_on "詳細"
      # 遷移先パスを確認
      expect(current_path).to eq "/evaluations/#{@evaluation.id}"
      # 各項目を入力する
      fill_in "review[clear]", with: "example"
      fill_in "review[dark]", with: "example"
      # 送信するとReviewのデータカウントが1増えることを確認
      expect{
        find('input[class="submit"]').click
      }.to change { Review.count }.by(1)
      # 送信後の遷移パスがEvaluation投稿詳細画面であることを確認
      expect(current_path).to eq "/evaluations/#{@evaluation.id}"
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
      # 未レビューの投稿が表示されていることを確認
      expect(page).to have_link('詳細', href: "/evaluations/#{@evaluation.id}")
      # クリックして上記投稿詳細画面へ遷移
      click_on "詳細"
      # 遷移先パスを確認
      expect(current_path).to eq "/evaluations/#{@evaluation.id}"
      # 各項目を未入力にする
      fill_in "review[clear]", with: ""
      fill_in "review[dark]", with: ""
      # 未入力で送信してもReviewのデータカウントが増えないことを確認
      expect{
        find('input[class="submit"]').click
      }.to change { Review.count }.by(0)
      # 送信後の遷移パスがEvaluation投稿詳細画面であることを確認
      expect(current_path).to eq "/evaluations/#{@evaluation.id}"
      # エラーメッセージが表示されていることを確認
      expect(page).to have_content("送信できませんでした。Clearは入力必須です。")
      expect(page).to have_content("送信できませんでした。Darkは入力必須です。")
    end
  end
end