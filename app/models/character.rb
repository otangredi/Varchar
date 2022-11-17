class Character < ApplicationRecord
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
