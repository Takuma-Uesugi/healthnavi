class Users::ChatRooms::MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @messages = Message.where(chat_room_id: @chat_room.id)
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_chat_room_messages_path(@message.user_id, @message.chat_room_id)
    else
      redirect_to user_chat_room_messages_path(@message.user_id, @message.chat_room_id), flash: {alert: "#{message.errors.full_messages.first}"}
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, chat_room_id: params[:chat_room_id])
  end
end
