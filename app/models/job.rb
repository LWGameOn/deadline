class Job < ApplicationRecord
  has_many :messages
  belongs_to :user
  belongs_to :hitman

  enum status: { pending: 0, accepted: 1, denied: 2, completed: 3 }

  validates :deadline, :details, :location, presence: true
end
