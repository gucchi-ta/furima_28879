class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    ActionCable.server.broadcast 'message_channel', content: @message if @message.valid?
  end

  private

  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
