class UsersController < ApplicationController
  skip_before_action :authenticate_user!

















  def show
    @user = User.find(params[:id])
    @trip = Trip.new
    authorize @user
  end
end
