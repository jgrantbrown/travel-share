class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_many :trips
  has_many :cities, through: :trips
end
