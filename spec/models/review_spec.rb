require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe "Review投稿" do
    context "Reviewが投稿できるとき" do
      it "ClearとDarkが入力されていれば登録できる" do
        expect(@review).to be_valid
      end
    end
    
    context "Reviewが投稿できないとき" do
      it "Clearが入力されていない場合、登録できない" do
        @review.clear = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Clearは入力必須です。")
      end

      it "Darkが入力されていない場合、登録できない" do
        @review.dark = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Darkは入力必須です。")
      end
    end
  end
end
