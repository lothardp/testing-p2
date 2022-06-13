require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  test "Crear una reserva sin datos" do
    res = Reservation.new()
    assert_not res.save()
  end

  test "Crear una resevra" do
    flight = flights(:one)
    res = Reservation.new({ flight_id: flight.id, user: 'Test user', seat: '1B' })
    assert res.save()
  end

  test "Crear una reserva con asiento usado" do
    flight = flights(:one)
    res = Reservation.new({ flight_id: flight.id, user: 'Test user', seat: '1A' })
    assert_not res.save()
  end
end
