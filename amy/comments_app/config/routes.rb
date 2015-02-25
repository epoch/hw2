Rails.application.routes.draw do
  get 'comments/index'

  resources :comments

end
