Rails.application.routes.draw do
  root 'users#home'

  resources :admin
  get 'admin/new_user'
  
  resources :projects
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
