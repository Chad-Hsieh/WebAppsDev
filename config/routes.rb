Rails.application.routes.draw do
  
  get 'users/index'
  resources :photos do
    resources :comments
  end
  
  # get photos/6/comments/2
  
  root to: 'home#index'
  get "about" => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
