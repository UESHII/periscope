class Evaluation < ApplicationRecord
  belongs_to :user
  has_many :progresses
  has_many :reviews

  with_options presence: true do
    validates :goal
    validates :fiscal_year
    validates :user
  end
end
