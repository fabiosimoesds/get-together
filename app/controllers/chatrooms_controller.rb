class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom) # Make te policy work when invitation is done.
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @user = User.find(params[:chatroom][:user])
    authorize @chatroom
    if @chatroom.save
      @invitation = Invitation.new
      @invitation.chatroom = @chatroom
      @invitation.asker = current_user
      @invitation.receiver = @user
      @invitation.save!
      InvitationNotification.with(invitation: " to #{@chatroom.name} Chatroom").deliver(@user)
      NotificationChannel.broadcast_to(
        @user,
        Notification.last.params[:invitation]
      )
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
