Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: [:sessions, :registrations]

  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
    get '/users/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration
    get 'sign_up', to: 'devise/registrations#new', as: :new_user_registration
    get '/users/edit', to: 'devise/registrations#cancel', as: :edit_user_registration
    patch '/users', to: 'devise/registrations#update', as: :user_registration
    put '/users', to: 'devise/registrations#update'
    delete '/users', to: 'devise/registrations#destroy'
    post '/users', to: 'devise/registrations#create'
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
