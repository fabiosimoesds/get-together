Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show]

  root to: "pages#home"

  resources :chatrooms, only: %i[index show create new] do
    resources :invitations, only: %i[create]
  end

  resources :trips, only: %i[index create]
end
