class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validates :user_id, presence: true
  validates :pet_id, presence: true, uniqueness: {scope: :user_id}


  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end
  end

end
