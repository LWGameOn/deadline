class Job < ApplicationRecord
  has_many :messages
  belongs_to :user
  belongs_to :hitman

  validates :deadline, :details, :location, presence: true
end
