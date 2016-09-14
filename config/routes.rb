Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :dialogs, only: [:index]

  root 'dialogs#index'
end
