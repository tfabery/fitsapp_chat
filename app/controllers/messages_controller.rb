class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast "messages_#{message_params[:chat_id]}",
          message: message.content,
          user: message.user.full_name
        head :ok
    else
      redirect_to user_chats_path(user: current_user)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
