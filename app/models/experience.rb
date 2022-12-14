class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :location, :price, :photo, presence: true
  validates :title, uniqueness: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo
end
