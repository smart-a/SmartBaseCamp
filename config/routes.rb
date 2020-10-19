Rails.application.routes.draw do

  get 'users/login'

  post 'users/signin', to: 'users#signin'

  get 'users/dashboard'
  get 'user/logout'
  get 'user/set_user'
  post 'user/update'

  resources :admin
  resources :projects
  resources :users
  
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
