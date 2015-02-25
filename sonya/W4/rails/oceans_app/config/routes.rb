Rails.application.routes.draw do
  root :to => 'oceans#index'

  # READ
  get '/oceans' => 'oceans#index'
  # CREATE
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'
  # READ
  get '/oceans/:id' => 'oceans#show', :as => 'ocean'
  # DELETE
  post 'oceans/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'
  # EDIT
  get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  # UPDATE
  post '/oceans/:id' => 'oceans#update'
end
