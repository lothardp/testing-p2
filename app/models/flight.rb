class Flight < ApplicationRecord
  has_many :reservations

  validates :origin, presence: true
  validates :destination, presence: true
  validates :datetime, presence: true
  validate :datetime_cannot_be_in_the_past

  def datetime_cannot_be_in_the_past
    errors.add(:datetime, "can't be in the past") if datetime && datetime < DateTime.now
  end

  def free_seat(seat)
    reservations.each do |r|
      puts r.seat, seat
      puts
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
