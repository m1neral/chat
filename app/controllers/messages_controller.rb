class MessagesController < ApplicationController
  before_action :require_signed_in, only: :create

  def create
    message = Message.new(message_params)
    message.sender_id = current_user.id

    if message.save
      receiver = User.find_by_id(message.receiver_id)
      broadcast_message_data = build_brodcast_message_data(message, receiver)

      # Don't have an essence of dialog, so broadcast the both channels
      ActionCable.server.broadcast("messages_#{message.sender_id}_#{receiver.id}", broadcast_message_data)
      ActionCable.server.broadcast("messages_#{receiver.id}_#{message.sender_id}",
        broadcast_message_data) unless message.sender_id == receiver.id
    else
      redirect_to dialogs_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :receiver_id)
      .merge(params.permit(:dialog_id))
  end

  def build_brodcast_message_data(message, receiver)
    {
        id: message.id,
        sender: current_user.name,
        receiver: receiver.name,
        sender_id: current_user.id,
        receiver_id: message.receiver_id,
        text: message.text,
        created_at: message.created_at
    }
  end
end
