Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/dialogs/:id', to: 'dialogs#show', as: :user

  resources :dialogs, only: [:index, :show] do
    resources :messages, only: :create
  end

  root 'dialogs#index'
end
