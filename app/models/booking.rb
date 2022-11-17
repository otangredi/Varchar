class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :character
  validates :start_date, :end_date, presence: true
  validates :status, presence: true

  enum status: {
    Pending: 0,
    Confirmed: 1,
    Denied: 2
  }, _prefix: true
end
