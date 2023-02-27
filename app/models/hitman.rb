class Hitman < ApplicationRecord
  belongs_to :user
  has_many :jobs

  validates :methods, :bio, :location, presence: true
end
