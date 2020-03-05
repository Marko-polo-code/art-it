class Collection < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  scope :favorited_by, ->(email) { joins(:favorites).where(favorites: { user: User.where(username: username)})}

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :address ],
    using: {
      tsearch: { prefix: true }
    }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
