class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:sender_id]}_#{params[:receiver_id]}"
  end

  def unsubscribed
  end
end
