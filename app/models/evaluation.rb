class Evaluation < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :progresses, dependent: :destroy
  has_many :reviews, dependent: :destroy

  with_options presence: true do
    validates :goal
    validates :fiscal_year
    validates :user
  end
end
