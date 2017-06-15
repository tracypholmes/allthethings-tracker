class User < ActiveRecord::Base
  has_many :comics
  has_secure_password

  # validations for username, email, pswd, w/ min pswd length
  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
