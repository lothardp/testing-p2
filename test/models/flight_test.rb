require "test_helper"

class FlightTest < ActiveSupport::TestCase
  test "Crear un vuelo sin datos" do
    flight = Flight.new
    assert_not flight.save
  end

  test "Crear un vuelo con datos" do
    flight = Flight.new({ datetime: Time.now, origin: 'NYC', destination: 'BCN'})
    assert flight.save
  end

  test "Vuelos futuros" do
    assert_equal Flight.all_future.length, 1
  end

  test "Porcentaje de ocupación" do
    assert_equal flights(:one).occupation_percentage, 0.83
    assert_equal flights(:two).occupation_percentage, 0
  end

  test "Asientos usados" do
    assert_equal flights(:one).taken_seats, ['1A']
    assert_equal flights(:two).taken_seats, []
  end

  test "Asiento disponible" do
    assert flights(:one).free_seat '1B'
    assert_not flights(:one).free_seat '1A'
  end

  test "Asiento valido" do
    assert flights(:one).valid_seat '1A'
    assert_not flights(:one).valid_seat '1Z'
  end
end
