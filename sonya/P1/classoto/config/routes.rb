Rails.application.routes.draw do
  root :to => 'pages#home'
<<<<<<< HEAD
  resources :users
=======
  resources :users, :only => [:new, :create, :index]
>>>>>>> photolist
  resources :pages

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  
end
