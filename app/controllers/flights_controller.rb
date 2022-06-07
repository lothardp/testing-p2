class FlightsController < ApplicationController
  def index
    # TODO: Add filters
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
