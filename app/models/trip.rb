class Trip < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  SPORTS = ["Surfing", "Skateboarding", "Skiing/Snowboarding", "Mountain Bike", "Hiking", "Paragliding"]

  has_one :album, dependent: :destroy
  # validates :album, presence: true
  # has_many :photos, through: :albums

  validates :address, presence: true, length: { minimum: 5 }
  validates :sport, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  include PgSearch::Model
  pg_search_scope :search_address,
                  against: %i[address],
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_sport,
                  against: %i[sport],
                  using: {
                    tsearch: { prefix: true }
                  }
end
