class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    @trip = Trip.new
    authorize @user
  end
end
