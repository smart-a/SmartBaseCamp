Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'users#home'
  

  get 'users/login'
  post 'users/signin', to: 'users#signin'
  get 'users/set_user', to: 'users#set_user'
  # post 'users/update', to: 'user#update'
  # get 'users/dashboard'
  # get 'project', to: 'projects#new'

  # get '/users/:id/show', to: 'users#show'
  
  get 'users' => "users#new"
  get 'users/logout' => "users#logout"
  # resources :users, only: [:new, :create, :show, :update]
 

  resources :users, only: [:new, :edit, :create, :show, :update] do 
    resources :projects do
      
      resources :app_threads do
        resources :messages # , only:[:new, :edit, :show, :update]
        # post '/:app_thread_id' => 'messages#create'
        # resources :thread_messages do # , controller: 'users/projects/app_threads/thread_messages'
           #, controller: 'users/projects/app_threads/thread_messages/messages'
        # end
      end
    end
  end
  
  resources :admin
  get 'admin/new_user'
  

end
