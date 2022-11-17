class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :characters, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :host_bookings, through: :characters, source: :bookings

  #   enum status: {
  #   pending: 0,
  #   active: 1,
  #   archived: 2
  # }
end
