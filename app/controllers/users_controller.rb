class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @users = policy_scope(User)
  end
end
