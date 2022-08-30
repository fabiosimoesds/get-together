class TripsController < ApplicationController
  # before_action :set_trip, only: %i[]

  def index
    @trips = policy_scope(Trip)
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip
    if @trip.save
      redirect_to trips_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_trip
  #   @trip = Trip.find(params[:id])
  # end

  def trip_params
    params.require(:trip).permit(:address, :sport, :start_date, :end_date)
  end
end
