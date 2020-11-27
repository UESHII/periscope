class Profile < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :team

  with_options :presence true do
    validates :user
    validates :team
  end
end
