class Review < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user

  with_options presence: true do
    validates :user
    validates :evaluation
  end
  validates :clear, presence: { message: "は入力必須です。" }
  validates :dark, presence: { message: "は入力必須です。" }
end
