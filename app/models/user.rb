class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :username, uniqueness: true
end
