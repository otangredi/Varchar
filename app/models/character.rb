class Character < ApplicationRecord
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, :description, :category, :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
