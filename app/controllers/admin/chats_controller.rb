class Admin::ChatsController < AdminController
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end
end
