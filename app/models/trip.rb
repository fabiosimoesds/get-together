class Trip < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: true # { scope: :trip.user }

  has_one :album
  # has_many :photos, through: :albums
  
  validates :address, presence: true, length: { minimum: 10 }
  validates :sport, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
