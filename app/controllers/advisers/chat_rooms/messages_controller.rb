class Advisers::ChatRooms::MessagesController < ApplicationController
  before_action :authenticate_adviser!
  
  def index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @messages = @chat_room.messages
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to adviser_chat_room_messages_path(@message.adviser_id, @message.chat_room_id)
    else
      redirect_to adviser_chat_room_messages_path(@message.adviaser_id, @message.chat_room_id), flash: {alert: "#{message.errors.full_messages.first}"}
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:body).merge(adviser_id: current_adviser.id, chat_room_id: params[:chat_room_id])
  end
end
