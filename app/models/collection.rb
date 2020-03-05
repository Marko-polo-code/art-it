class Collection < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  scope :favorited_by, ->(email) { joins(:favorites).where(favorites: { user: User.where(username: username)})}
end
