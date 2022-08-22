class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :description, :location, :price, :start_date, :end_date, presence: true
  validates :title, uniqueness: true
  
end
