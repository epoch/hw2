Rails.application.routes.draw do
  root :to => 'authors#index'
  resources :books, :authors

end
