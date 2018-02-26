class Dog < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :breed, presence: true
end
