Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :chatrooms, only: %i[index show create new] do
    resources :invitations, only: %i[create]
  end

  devise_scope :user do
    get 'users/', to: 'users/users#index', as: 'users'
    get 'users/:id', to: 'users/users#show', as: 'user'
  end
end
