class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :characters, dependent: :destroy
  has_many :bookings, dependent: :destroy

  #   enum status: {
  #   pending: 0,
  #   active: 1,
  #   archived: 2
  # }
end
