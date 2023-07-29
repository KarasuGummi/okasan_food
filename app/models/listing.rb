class Listing < ApplicationRecord
  belongs_to :user, optional: true

  # Uncomment once active storage has been installed
  has_one_attached :photo
  has_many :bookings
  has_many :reviews, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category, against: [ :name, :category ],using: {
    tsearch: { prefix: true }
  }
end
