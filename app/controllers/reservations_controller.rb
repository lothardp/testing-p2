class ReservationsController < ApplicationController
  def create
    @flight = Flight.find(params[:id])
    @taken_seats = @flight.taken_seats
    @columns = TestingP2::Application::VALID_COLUMNS
    @max_files = TestingP2::Application::MAX_FILES
    user = params[:user]
    seats = params[:seats].split('-')
    if seats.uniq.length != seats.length
      @repeated_seats = true
      return render "flights/show"
    end

    if user == ""
      @empty_user = true
      return render "flights/show"
    end
    if seats == []
      @empty_seats = true
      return render "flights/show"
    end


    @errors = []
    reservations = []
    seats.each do |seat|
      reservation = Reservation.new(user: user, seat: seat, flight_id: @flight.id)
      reservations << reservation
    end

    reservations.each do |r|
      if !r.valid?
        @errors << r.errors
      end
    end
    return render "flights/show" unless @errors.empty?

    reservations.each do |r|
      r.save
    end

    redirect_to flights_path, notice: "Reservation created"
  end
end
