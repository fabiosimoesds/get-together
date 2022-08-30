class Invitation < ApplicationRecord
  belongs_to :chatroom
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
