class DialogsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @receiver = User.find(params[:id])
  end
end
