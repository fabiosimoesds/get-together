class Album < ApplicationRecord
  belongs_to :trip
  has_many_attached :photos
  has_one :user, through: :trip, source: :user
end
