Doitthatway::Application.routes.draw do
  root 'random_videos#show'

  resources :videos, only: [:show, :create] do
    resource :tag, only: [:update]
    resource :comment, only: [:create]
    post 'vote' => 'votes#create'
  end

  resource :random_video, only: [:show]

  resource :youtube_parser, only: [:show]

  resources :tags, only: [:show]

  resources :comments, only: [:destroy]

  resources :users, only: [:index, :destroy] do
    resource :access, only: [:update]
  end

  resources :unpublished_submissions, only: [:index, :update]
  resources :submissions, only: [:update, :destroy]
  resources :null_videos, only: [:index], path: 'no_videos'

  resource :video_search, only: [:show]
  resource :user_search, only: [:show]

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
