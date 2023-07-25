class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  enum status: { pending: 0, accepted: 1, declined: 2 }, _default: 0
end
