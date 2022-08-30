class Trip < ApplicationRecord
  belongs_to :user

  # has_one :album
  # validates :album, presence: true
  # has_many :photos, through: :albums

  validates :address, presence: true, length: { minimum: 5 }
  validates :sport, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
