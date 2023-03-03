class Hitman < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_one_attached :photo

  validates :methods, :bio, :location, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_location_and_method,
    against: [ :location, :method, :name ],
    using: {
      tsearch: { prefix: true }
    }
end
