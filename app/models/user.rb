class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
