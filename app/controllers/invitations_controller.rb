class InvitationsController < ApplicationController
  def update
    @invitation = Invitation.find(params[:id])
    authorize @invitation
    @invitation.confirmation = params[:invitation][:confirmation]
    if @invitation.confirmation
      ConfirmationNotification.with(note: "#{@invitation.receiver.first_name} #{@invitation.receiver.last_name} accepted your invitation").deliver(@invitation.asker)
      NotificationChannel.broadcast_to(
        @invitation.asker,
        Notification.last.params[:note]
      )
    end
    redirect_to notifications_path if @invitation.save
  end
end
