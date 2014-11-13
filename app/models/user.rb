class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_many :notes

  def display_name
    name.presence || email
  end
end
