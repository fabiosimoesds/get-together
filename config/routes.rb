Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show edit update]

  root to: "pages#home"

  resources :chatrooms, only: %i[index show create new] do
    resources :invitations, only: %i[create]
    resources :messages, only: %i[create]
  end

  resources :trips, only: %i[index create show]
  resources :albums, only: %i[show edit update]

  get '/search', to: 'trips#search', as: :search
end
