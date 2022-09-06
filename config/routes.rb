Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show edit update]

  resources :notifications, only: :index

  resources :invitations, only: %i[update]

  root to: "pages#home"

  resources :chatrooms, only: %i[index show create new] do
    resources :invitations, only: %i[create]
    resources :messages, only: %i[create]
  end

  resources :trips, only: %i[index create show]
  resources :albums, only: %i[index show edit update destroy] do
    member do
      delete :delete_photo_attachment
    end
  end

  get '/search', to: 'trips#search', as: :search
end
