class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  before_save :set_total_price


  def set_total_price
    self.total_price = ((self.end_date - self.start_date).to_i + 1)* self.collection.price
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
