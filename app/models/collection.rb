class Collection < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
