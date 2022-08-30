class Chatroom < ApplicationRecord
  has_many :invitations
  validates :name, presence: true
end
