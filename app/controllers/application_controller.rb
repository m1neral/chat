class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_signed_in
    unless user_signed_in?
      redirect_to(dialogs_path, flash: { sign_up_warning: t('.sign_up_warning') })
    end
  end
end
