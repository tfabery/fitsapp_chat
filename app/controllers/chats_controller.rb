require 'securerandom'

class ChatsController < ApplicationController
  def index
    @chats = current_user.chats
  end

  def new
    @chat = Chat.new(identifier: SecureRandom.hex)
    @users = User.all_except(current_user.id)
  end

  def create
    @chat = Chat.new(identifier:SecureRandom.hex)
    if @chat.save
      other_user = User.find(chat_params[:other_user])
      @chat.subscriptions.create(user: current_user)
      @chat.subscriptions.create(user: other_user)
      @chat.messages.create(content: chat_params[:message], user: current_user)
      redirect_to user_chat_path(current_user, @chat, other_user: other_user.id)
    end
  end

  def show
    @other_user = User.find(params[:other_user])
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  private

  def chat_params
    params.require(:chat).permit(:other_user, :message)
  end
end
