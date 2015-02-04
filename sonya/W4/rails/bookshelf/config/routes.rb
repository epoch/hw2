Rails.application.routes.draw do
  #devise_for :users
  root :to => 'authors#index'
  resources :authors, :books
end
