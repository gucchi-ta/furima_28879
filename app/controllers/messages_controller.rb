class MessagesController < ApplicationController
  def create
    # binding.pry
    # message = Message.create(message_params)
    # redirect_to "/items/#{message.item.id}" 
    # binding.pry
    if @message = Message.create(message_params)
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private
  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
