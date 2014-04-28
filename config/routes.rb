Doitthatway::Application.routes.draw do
  root 'videos#index'

  resources :videos, only: [:show]

  resources :users, only: [:index, :destroy] do
    resource :access, only: [:update]
  end

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
