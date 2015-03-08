Rails.application.routes.draw do
  root :to => 'static_pages#home'
  resources :authors
  resources :books
end
