class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validation
  validates :name, presence: true

  # profile picture
  has_one_attached :photo

  # convert location to lat and lon
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  
  # association
  has_many :pets, dependent: :destroy
  has_many :bookings, through: :pets

end
# Geocoder.search([-38.07, 145.355]).first.postal_code
# Geocoder.search("#{postal_code}, Australia").first