Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/home' => 'pages#home'
end
