require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe "プロフィール作成" do
    context "プロフィール作成できるとき" do
      it "連絡先、所属チーム、入社日が正しく入力されていれば登録できる" do
        expect(@profile).to be_valid
      end
    end
    
    context "プロフィール作成できないとき" do
      it "連絡先が入力されていない場合、登録できない" do
        @profile.contact = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("連絡先情報は入力必須です。")
      end

      it "所属チームが入力されていない場合、登録できない" do
        @profile.team_id = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("所属チームは入力必須です。")
      end

      it "入社日が入力されていない場合、登録できない" do
        @profile.joining_date = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("入社日は入力必須です。")
      end
    end
  end
end
