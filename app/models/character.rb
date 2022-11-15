class Character < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
