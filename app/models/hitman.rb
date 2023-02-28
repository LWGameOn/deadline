class Hitman < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many_attached :photos

  validates :methods, :bio, :location, presence: true
end
