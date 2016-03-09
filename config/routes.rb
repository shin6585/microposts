Rails.application.routes.draw do
  get 'follwer_users/show'

  get 'following_users/show'

  get 'users/edit'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :following_users, only: [:show]
  resources :follower_users, only: [:show]

end