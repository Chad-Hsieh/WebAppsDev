Rails.application.routes.draw do

  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  get "logout" => 'sessions#destroy'
  resources :users
  resources :sessions
  resources :photos do
    resources :comments
  end
  
  # get photos/6/comments/2
  
  root to: 'home#index'
  get "about" => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
