class User < ApplicationRecord
  has_many :messages
  has_many :trips
  has_many :invitations_as_asker, class_name: "invitation", foreign_key: :asker_id
  has_many :invitations_as_receiver, class_name: "invitation", foreign_key: :receiver_id

  has_one_attached :avatar
  has_one_attached :banner

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :dob, :address, presence: true
  validates :last_name, format: { with: /\A[a-zA-Z]+/, message: "Use only letters and white space" }
  validates :first_name, format: { with: /\A[a-zA-Z]+/, message: "Use only letters and white space" }
end
