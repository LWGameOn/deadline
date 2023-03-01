class Hitman < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_one_attached :photo

  validates :methods, :bio, :location, presence: true
end
