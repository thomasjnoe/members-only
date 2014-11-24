Rails.application.routes.draw do
  resources :users

  #root 'welcome#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
