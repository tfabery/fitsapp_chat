Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#index'

  resources :users, only: [:show] do
    resources :chats, only: [:index, :show, :new, :create]
  end

  resources :messages, only: [:create]

  namespace 'admin' do
    resources :chats, only: [:index, :show] do
      resources :messages, only: [:edit, :update, :destroy]
    end
  end

  mount ActionCable.server => '/cable'
end
