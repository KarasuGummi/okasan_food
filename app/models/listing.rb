class Listing < ApplicationRecord
  belongs_to :user, optional: true

  # Uncomment once active storage has been installed
  has_one_attached :photo
  has_many :bookings
end
