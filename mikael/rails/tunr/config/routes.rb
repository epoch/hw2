Rails.application.routes.draw do
  root :to => "pages#home"
  get "/home" => "pages#home"

  resources :users, :only => [:new, :create, :index]

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  get "/about" => "pages#about"
end
