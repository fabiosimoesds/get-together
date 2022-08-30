class InivitationsController < ApplicationController
  def create
    @invitation = Invitation.new
    @chatroom = Chatroom.find(params[:id])
    @invitation.chatroom = @chatroom
    @invitation.asker = current_user
    @invitation.receiver = User.find(:id) # How to get the receiver id?
    if @invitation.save
      redirect_to chatroom_path(@chatroom)
    # else adicionar talvez com um JavaScrip alert
    end
  end
end
