class DialogsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if current_user
      @receiver = User.find(params[:id])
      @dialog = Message.get_dialog(
        current_user, @receiver).map { |msg| MessageSerializer.new(msg).attributes }
    else
      redirect_to(dialogs_path, flash: { sign_up_warning: t('.sign_up_warning') })
    end
  end
end
