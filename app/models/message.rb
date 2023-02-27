class Message < ApplicationRecord
  belongs_to :job

  validates :content, presence: true
end
