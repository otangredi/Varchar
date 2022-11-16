class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :character
  validates :start_date, :end_date, presence: true
  validates :status, presence: true

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }, _prefix: true
end
