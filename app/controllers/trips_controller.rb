class TripsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_trip

  def index
    @trips = Trip.all
    authorize @trips
  end

  def show
    authorize @trips
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:address, :sport, :start_date, :end_date, :album)
  end
end
