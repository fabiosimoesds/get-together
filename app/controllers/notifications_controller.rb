class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
    @notifications = @notifications.where(recipient: current_user)
  end
end
