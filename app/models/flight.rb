class Flight < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :origin, presence: true
  validates :destination, presence: true
  validates :datetime, presence: true
  validate :datetime_cannot_be_in_the_past

  def self.all_future
    all.where("datetime > ?", Time.now.strftime("%Y-%m-%d %H:%M"))
  end

  def taken_seats
    taken_seats = []
    reservations.all.each do |r| 
      taken_seats << r.seat
    end
    taken_seats
  end

  def occupation_percentage
    ((reservations.count.to_f / (TestingP2::Application::TOTAL_SEATS)) * 10000).to_i.to_f / 100
  end

  def datetime_cannot_be_in_the_past
    errors.add(:datetime, "can't be in the past") if datetime && datetime < Time.now.strftime("%Y-%m-%d %H:%M")
  end

  def free_seat(seat)
    reservations.each do |r|
      return false if seat == r.seat
    end
    true
  end

  def valid_seat(seat)
    file = seat[..-2].to_i
    column = seat[-1]
    return false if file < 1 || file > TestingP2::Application::MAX_FILES
    return false unless TestingP2::Application::VALID_COLUMNS.include? column

    true
  end
end
