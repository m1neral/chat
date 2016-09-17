class DialogsController < ApplicationController
  before_action :require_signed_in, only: :show

  def index
    @users = User.all
  end

  def show
      @receiver = User.find(params[:id])
      @dialog = Message.get_dialog(
        current_user, @receiver).map { |msg| MessageSerializer.new(msg).attributes }
  end
end
