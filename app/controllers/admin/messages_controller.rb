class Admin::MessagesController < AdminController
  def edit
    @message = Message.find(params[:id])
  end

  def update
    chat = Chat.find(params[:chat_id])
    @message = Message.find(params[:id])
    if @message.update!(message_params)
      redirect_to admin_chat_path(chat)
    else
      render 'edit'
    end
  end

  def destroy
    chat = Chat.find(params[:chat_id])
    Message.find(params[:id]).destroy
    flash[:success] = "Message deleted"
    redirect_to admin_chat_path(chat)
  end

  private

  def message_params
    params.require(:admin).permit(:content)
  end
end
