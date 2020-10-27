Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  
  get '/' => 'pages#home'
  get 'login' => 'pages#login'
  post 'signin' => 'pages#signin'
  get 'signup' => 'pages#new'
  get 'logout' => "pages#logout"
  # get '/users/:id/show', to: 'users#show'
  
  get 'users' => "users#new"

 
  resources :users, only: [:new, :edit, :create, :show, :update] do 
    resources :projects do
      resources :attachments, only: [:index, :new, :create, :destroy]
      resources :app_threads do
        resources :messages
      end
    end
  end
  root 'users#show'
  
  
  resources :admin
  get 'admin/new_user'
  

end
