class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true

  has_many :notes
end
