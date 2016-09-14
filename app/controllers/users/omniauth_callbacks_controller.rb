class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    @user = User.from_vk(request.env['omniauth.auth'])

    sign_in_and_redirect @user
  end
end