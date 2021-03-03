class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # profile picture
  has_one_attached :photo
  
  # association
  has_many :pets, dependent: :destroy
  has_many :bookings, through: :pets
end
