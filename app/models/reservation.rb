class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :user, presence: true
  validates :dog, presence: true
end
