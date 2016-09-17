class MessagesController < ApplicationController
  before_action :require_signed_in, only: :create

  def create
    message = Message.new(message_params)
    message.sender_id = current_user.id

    if message.save
      # cable actions
    else
      redirect_to dialogs_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :receiver_id)
        .merge(params.permit(:dialog_id))
  end
end
