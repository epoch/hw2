Rails.application.routes.draw do
  root :to => 'authors#index'
  resources :authors, :books, :users
end
