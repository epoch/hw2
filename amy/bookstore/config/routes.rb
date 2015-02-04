Rails.application.routes.draw do

  root :to => 'authors#index'

  resources :authors
  resources :books
end
