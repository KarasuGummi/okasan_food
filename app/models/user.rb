class User < ApplicationRecord
  has_many :bookings, dependent: :delete_all
  has_many :listings, dependent: :delete_all
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
