class Reservation < ApplicationRecord
  belongs_to :flight

  validates :user, presence: true
  validates :seat, presence: true
  validate :valid_seat

  def valid_seat
    if id
      actual_reservation = Reservation.find(id) 
      return true if actual_reservation.seat == seat
    end
    errors.add(:seat, "is invalid") unless seat && flight.valid_seat(seat)
    errors.add(:seat, "isn't available") unless seat && flight.free_seat(seat)
  end
end
