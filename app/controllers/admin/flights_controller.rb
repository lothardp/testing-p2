class Admin::FlightsController < Admin::AdminController
  before_action :set_flight, only: %i[show edit update destroy]

  # GET /flights or /flights.json
  def index
    # TODO: add stats
    # TODO: add  occupation percentage
    @flights = Flight.all
    reservations = Reservation.all
    @total_reservations = reservations.count
    @total_users = Reservation.distinct.pluck(:user).count
    @total_flights = @flights.count
    @average_occupation = average_occupation
  end

  # GET /flights/1 or /flights/1.json
  def show; end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit; end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to admin_flights_url, notice: 'Flight was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy
    redirect_to admin_flights_url, notice: 'Flight was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flight
    @flight = Flight.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.require(:flight).permit(:datetime, :origin, :destination)
  end

  def average_occupation
    return 0 if Flight.all.count == 0

    total_seats = TestingP2::Application::TOTAL_SEATS * Flight.all.count
    ((Reservation.all.count.to_f / total_seats) * 10_000).to_i.to_f / 100
  end

  def set_selected
    @selected = 'flights'
  end
end
