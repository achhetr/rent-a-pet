class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :user_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
