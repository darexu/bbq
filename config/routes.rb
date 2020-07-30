Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  root 'events#index'

  resources :events
  resources :users, only: [:show, :edit, :update]
end
