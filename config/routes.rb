Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :dialogs, only: [:index, :show]
  get '/dialogs/:id', to: 'dialogs#show', as: :user

  root 'dialogs#index'
end
