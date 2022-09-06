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
    authorize @chatroom
    if @chatroom.save
      unless params[:chatroom][:user_array]
        @user = User.find(params[:chatroom][:user])
        @users_array = [@user.id]
      else
        @users_array = params[:chatroom][:user_array].split
        @users_array = @users_array.reject { |id| id == "0" }
      end
      @users_array.each do |user_id|
        @user = User.find(user_id)
        @invitation = Invitation.new
        @invitation.chatroom = @chatroom
        @invitation.asker = current_user
        @invitation.receiver = @user
        @invitation.save!
        InvitationNotification.with(invitation: "You were invited to #{@chatroom.name} Chatroom", id: @invitation).deliver(@user)
        NotificationChannel.broadcast_to(
          @user,
          Notification.last.params[:invitation]
        )
      end
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
