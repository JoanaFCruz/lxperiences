class Booking < ApplicationRecord
  belongs_to :user, foreign_key: true
  belongs_to :experience
  validates :start_date, comparison: { less_than: :end_date }
end
