class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :evaluations
  has_many :progresses
  has_many :reviews

  NAME_REGEX = /\A[a-zA-Zぁ-んァ-ン一-龥\s]+\z/
  
  validate :password_complexity
  with_options presence: true do
    validates :name, format: { with: NAME_REGEX, message: "is invalid."}
    validates :email
  end

  def password_complexity
    return if password.blank? || password =~ /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    errors.add :password, 'Input 6 characters at least, use both of letter and number.'
  end

end
