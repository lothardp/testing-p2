class Admin::ReservationsController < Admin::AdminController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @filter_user = params[:user]
    @reservations = if @filter_user && @filter_user != ''
                      Reservation.all.where(user: @filter_user)
                    else
                      Reservation.all
                    end
  end

  def edit; end

  def update
    if @reservation.update(reservation_params)
      redirect_to admin_reservations_path, notice: 'Reservation was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to admin_reservations_url, notice: 'Reservation was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:user, :seat, :flight_id)
  end
end
