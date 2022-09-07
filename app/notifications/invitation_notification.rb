# To deliver this notification:
#
# InvitationNotification.with(invitation: 'You have a new Invitation').deliver(@user)
# InvitationNotification.with(post: @post).deliver(current_user)

class InvitationNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :invite
  param :id

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def custom_stream
  #   "user_#{recipient.id}"
  # end

  # def action_cable_data
  #   { user_id: recipient.id }
  # end

  # def url
  #   user_path(@user)
  # end
end
