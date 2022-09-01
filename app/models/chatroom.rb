class Chatroom < ApplicationRecord
  has_many :invitations
  has_many :messages
  validates :name, presence: true
end
