class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :location, :price, presence: true
  validates :title, uniqueness: true

end
