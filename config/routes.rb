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
    resources :admin
    get 'admin/new_user'
    resources :projects do
      resources :attachments, only: [:index, :create, :destroy]
      resources :project_users, only: [:index, :create, :destroy]
      resources :app_threads, except: [:index, :new] do
        resources :messages, except: [:index, :new]
      end
    end
  end
  root 'users#show'
  
  
  
  

end
