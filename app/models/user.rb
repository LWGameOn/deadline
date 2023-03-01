class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :hitmen, dependent: :destroy
  has_one :hitman
  has_many :jobs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
