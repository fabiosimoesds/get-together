class Chatroom < ApplicationRecord
  has_many :invitations, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, presence: true
end
