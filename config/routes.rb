Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'users#home'
  
 
  get 'users/login'
  post 'users/signin', to: 'users#signin'
  
  get 'users/dashboard'
  get '/users/show', to: 'users#show'
  get 'users/set_user', to: 'users#set_user'
  post 'users/update', to: 'user#update'
  get 'users/dashboard'
  get 'project', to: 'projects#new'

  get '/users/:id/show', to: 'users#show'
  
  get 'user/logout'
  
  resources :users

  resources :projects
  
  resources :admin
  get 'admin/new_user'
  

end
