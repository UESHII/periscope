class Evaluation < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :goal, presence: { message: "は入力必須です。" }
  validates :fiscal_year, presence: { message: "は入力必須です。" }
  validates :user, presence: true
end
