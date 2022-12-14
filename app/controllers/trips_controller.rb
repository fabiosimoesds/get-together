class TripsController < ApplicationController
  before_action :set_trip, only: %i[search]

  def index
    @trips = policy_scope(Trip)
    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        info_window: render_to_string(partial: "info_window", locals: {trip: trip})
      }
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip
    if @trip.save
      @album = Album.create!(name: "#{@trip.sport} in #{@trip.address}", trip: @trip)
      redirect_to trips_path
    else
      redirect_to user_path(current_user), status: :unprocessable_entity
    end
  end

  def search
    @trips = Trip.near(@trip.address, 25)
    @chatroom = Chatroom.new
    @trips = @trips.search_sport(@trip.sport)
    if params[:query].present?
      sql_query = <<~SQL
        trips.address @@ :query
        AND trips.sport @@ :query
      SQL
      @trips = Trip.joins(:users).where(sql_query, query: "%#{params[:query]}%")
    else
      "No buddies available at the moment"
    end
    authorize @trips
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def destroy
    @trip = Trip.find(params[:id])
    authorize @trip
    @trip.destroy
    redirect_to trips_path, status: :see_other
  end

  private

  def set_trip
    @trip = Trip.find(params[:format])
  end

  def trip_params
    params.require(:trip).permit(:address, :sport, :start_date, :end_date)
  end
end
