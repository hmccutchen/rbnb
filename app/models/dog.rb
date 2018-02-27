class Dog < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :breed, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
   mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_breed_name_age,
    against: [ :breed, :age, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
