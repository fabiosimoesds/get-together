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
    if params[:invitation]
      @chatroom = Chatroom.new(name: params[:invitation][:name])
    else
      @chatroom = Chatroom.new(name: params[:chatroom][:name])
    end
    authorize @chatroom
    if @chatroom.save
      unless params[:invitation]
        @user = User.find(params[:chatroom][:user])
        @users_array = [@user.id]
      else
        @users_array = params[:invitation][:user_array]
        @users_array = @users_array.reject { |id| id == "0" }
      end
      @users_array.each do |user_id|
        @user = User.find(user_id)
        @invitation = Invitation.new
        @invitation.chatroom = @chatroom
        @invitation.asker = current_user
        @invitation.receiver = @user
        @invitation.save!
        InvitationNotification.with(invite: "You were invited to #{@chatroom.name} Chatroom", id: @invitation).deliver(@user)
        NotificationChannel.broadcast_to(
          @user,
          Notification.last.params[:invite]
        )
      end
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end

end
