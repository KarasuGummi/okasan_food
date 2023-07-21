class Listing < ApplicationRecord
  belongs_to :user

  # Uncomment once active storage has been installed
  has_one_attached :photo
  has_many :bookings
end
