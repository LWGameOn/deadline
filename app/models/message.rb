class Message < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :content, presence: true
end
