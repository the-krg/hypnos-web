class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :nights
  has_many :days

  validates :username, uniqueness: true, presence: true
  validates :encrypted_password, presence: true
end
