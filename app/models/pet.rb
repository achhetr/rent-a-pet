class Pet < ApplicationRecord
  # association
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # profile picture
  has_one_attached :photo
  
  # validations
  validates :user_id, presence: true
  validates :name, presence: true
  validates :price, presence: true

<<<<<<< HEAD
=======
  # Pet Type
  def self.all_type
    %w(Dog Cat)
  end
>>>>>>> edd61dc466bc9cd7c37a0945c8df96ac433dd94c
end
