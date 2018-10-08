Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :like_microposts
      get :liked_microposts
      get :likes
    end
    
  end
  
  resources :microposts, only: [:index, :show, :new, :create] do
    member do
      get :like_microposts
      get :liked_microposts
    end
  end
  
  resources :likes, only: [:create, :destroy]

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
end