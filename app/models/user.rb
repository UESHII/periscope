class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :evaluations
  has_many :progresses
  has_many :reviews

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  
  with_options presence: true do
    validates :name, format: { with: NAME_REGEX, message: "is invalid. Input full-width characters."}
    validates :email
    validates :password, format: { with: PASSWORD_REGEX, message: "is invalid. Input 6 characters at least, use both of letter and number."}
  end
end
