class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :team

  with_options presence: true do
    validates :user
    validates :team
    validates :contact
    validates :joining_year
  end
end
