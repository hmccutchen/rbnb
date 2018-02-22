class Dog < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :breed, presence: true


end
