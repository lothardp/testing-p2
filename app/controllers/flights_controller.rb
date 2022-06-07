class FlightsController < ApplicationController
  def index
    @flights = Flight.all_future

    @filters = params[:filters]
    if @filters
      @flights = @flights.select { |f| f.datetime == @filters['datetime'] } if @filters['datetime'] && @filters['datetime'] != ''
      @flights = @flights.select { |f| f.origin == @filters['origin'] } if @filters['origin'] && @filters['origin'] != ''
      @flights = @flights.select { |f| f.destination == @filters['destination'] } if @filters['destination'] && @filters['destination'] != ''
    else
      @filters = {}
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
