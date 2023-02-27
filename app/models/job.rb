class Job < ApplicationRecord
  has_many :messages
  belongs_to :user

  validates :deadline, :details, :location, presence: true
end
