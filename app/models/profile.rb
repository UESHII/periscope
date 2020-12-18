class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :team
  has_one_attached :avatar

  validates :user, presence: true
  validates :team, presence: { message: "は入力必須です。" }
  validates :contact, presence: { message: "は入力必須です。" }
  validates :joining_date, presence: { message: "は入力必須です。" }
end
