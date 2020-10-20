Rails.application.routes.draw do
  resources :app_threads
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'users#home'
  
 
  get 'users/login'
  post 'users/signin', to: 'users#signin'
  
  get 'users/dashboard'
  
  get 'user/logout'
  get 'user/set_user'
  post 'user/update'
  resources :users

  resources :projects do
    resources :app_threads, controller: 'projects/app_threads'
  end
  
  resources :admin
  get 'admin/new_user'
  

end
