class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update]

  def index
    @users = policy_scope(User)
  end

  def show
    @trip = Trip.new
    @chatroom = Chatroom.new
    @trips = Trip.where(user: User.find(params[:id]))
    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        info_window: render_to_string(partial: "trips/info_window", locals: {trip: trip})
      }
    end
    @albums = Album.all.select { |album| album.trip.user == User.find(params[:id]) }
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.update(user_params)
    sports = params[:user][:sport_one].reject { |sport| sport == "0" }
    @user.update(sport_one: sports[0])
    @user.update(sport_two: sports[1])
    @user.update(sport_three: sports[2])
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :banner, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
