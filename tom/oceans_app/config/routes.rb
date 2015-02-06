Rails.application.routes.draw do
  root :to => 'pages#home', :as => 'home'

  # Read
  get '/oceans' => 'oceans#index'

  # Create
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'

  # Show a single ocean
  get '/oceans/:id' => 'oceans#show', :as => 'ocean'

  # Update
  get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  post 'oceans/:id' => 'oceans#update'

  # Delete
  post '/oceans/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'
end
