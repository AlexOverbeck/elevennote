class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create
  validates :password_confirmation, presence: true
  before_create :generate_api_key

  has_many :notes

  def display_name
    name.presence || email
  end

  def generate_api_key
    self.api_key = BCrypt::Password.create(password_digest)
  end
end
