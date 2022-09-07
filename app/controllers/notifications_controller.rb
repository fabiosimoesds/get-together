class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
    @notifications = @notifications.where(recipient: current_user)
    @quantity = @notifications.where(read_at: nil).count
    @notifications.each do |notification|
      notification.read_at = DateTime.now
      notification.save
    end
  end
end

# Notification.where(recipient: current_user).where(read_at: nil).count
