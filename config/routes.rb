Rails.application.routes.draw do

  resources :users
  resources :posts, only: [:new, :create, :index]

  root 'posts#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
