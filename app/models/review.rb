class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :user, through: :trip
  belongs_to :city, through: :trip
end
