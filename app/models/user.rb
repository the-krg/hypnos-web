class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :username, uniqueness: true, presence: true
  validates :encrypted_password, presence: true
end
