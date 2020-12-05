class Review < ApplicationRecord
  belongs_to :evaluation
  belongs_to :user

  with_options presence: true do
    validates :user
    validates :evaluation
    validates :clear
    validates :dark
  end
end
