class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_id, presence: true
  validates :pet_id, presence: true, uniqueness: {scope: :pet_id}
end
