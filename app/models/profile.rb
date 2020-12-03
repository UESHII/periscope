class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, dependent: :destroy
  belongs_to_active_hash :team

  with_options presence: true do
    validates :user
    validates :team
    validates :contact
  end
end
