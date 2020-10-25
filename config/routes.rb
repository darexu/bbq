Rails.application.routes.draw do

  devise_for :users, controllers: do
    omniauth_callbacks: 'users/omniauth_callbacks'
  end, skip: [:sessions]

  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'events#index'

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]

    post :show, on: :member
  end

  resources :users, only: [:show, :edit, :update]
end
