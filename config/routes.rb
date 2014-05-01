Doitthatway::Application.routes.draw do
  root 'videos#index'

  resources :videos, only: [:show, :create] do
    post 'vote' => 'votes#create'
  end

  resources :users, only: [:index, :destroy] do
    resource :access, only: [:update]
  end

  resources :unpublished_submissions, only: [:index, :update]
  resources :submissions, only: [:update, :destroy]
  resources :null_videos, only: [:index], path: 'no_videos'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
