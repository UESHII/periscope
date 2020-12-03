class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :evaluations, dependent: :destroy
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

  # instead of deleting, indicate the user requested a delete & timestamp it  
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end  
  
  # ensure user account is active  
  def active_for_authentication?  
    super && !deleted_at  
  end  
  
  # provide a custom message for a deleted account   
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end  
end
