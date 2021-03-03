class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :user_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
