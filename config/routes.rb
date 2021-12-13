Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  resources :friends, only: [:index, :create, :destroy]
  resources :friend_requests do
    member do
      post :accept
      post :reject
    end
  end
  devise_for :users
  resources :user_posts
  match 'users/:id' => 'users#show', :as => :user, :via => :get
  match 'pending_requests' => 'friend_requests#index', :as => :pending_requests, :via => :get
  match 'friend_requests/:id' => 'friend_requests#update', :as => :accept_request, :via => :put
  root 'user_posts#index'
end
