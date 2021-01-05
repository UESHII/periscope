require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー登録" do
    it "名前、連絡先情報、入社日が正しく入力されていれば登録できる" do
      expect(@user).to be_valid
    end

    it "メールアドレスが未入力の場合、登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it "パスワードが未入力の場合、登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "確認用パスワードとパスワードの入力が一致しません")
    end

    it "確認用パスワードが未入力の場合、登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
    end

    it "パスワードと確認用パスワードが一致しない場合、登録できない" do
      @user.password = "test11"
      @user.password = "test12"
      @user.valid?
      expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
    end

    it "パスワードが半角英数字混合ではない場合、登録できない" do
      @user.password = "111111"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字混合の6文字以上を入力して下さい")
    end

    it "パスワードが6文字以下の場合、登録できない" do
      @user.password = "test1"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
  end
end
