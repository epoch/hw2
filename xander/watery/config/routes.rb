Rails.application.routes.draw do
  root :to => 'oceans#index' 
  get '/oceans' => 'oceans#index'
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'
  get '/oceans/:id' => 'oceans#show', :as => 'ocean'
  post '/oceans/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'
  get '/oceans/:id/edit' => 'oceans#update', :as => 'ocean_edit'

end
