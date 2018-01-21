class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      ActionCable.server.broadcast('messages',
        message: message.content,
        user: message.user.username
      )
      # head :ok
      # redirect_to message.chatroom
    # else
    #   redirect_to message.chatroom, flash[:notice] = message.errors.messages
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end

end
