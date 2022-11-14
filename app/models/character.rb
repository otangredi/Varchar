class Character < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
