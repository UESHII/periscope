require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  before do
    @evaluation = FactoryBot.build(:evaluation)
  end

  describe "Evaluation投稿" do
    context "Evaluationが投稿できるとき" do
      it "営業期、翌期の目標が入力されていれば登録できる" do
        expect(@evaluation).to be_valid
      end
    end
    
    context "Evaluationが投稿できないとき" do
      it "営業期が入力されていない場合、登録できない" do
        @evaluation.fiscal_year = ""
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("営業期は入力必須です。")
      end

      it "翌期の目標が入力されていない場合、登録できない" do
        @evaluation.goal = ""
        @evaluation.valid?
        expect(@evaluation.errors.full_messages).to include("翌期の目標は入力必須です。")
      end
    end
  end
end
