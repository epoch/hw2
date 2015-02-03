Rails.application.routes.draw do

    root :to => 'home#index'

    get '/home' => 'home#index'

    get '/oceans' => 'oceans#index'

    get '/oceans/new' => 'oceans#new'

    post '/oceans' => 'oceans#create'

    get '/oceans/:id' => 'oceans#show', :as => 'ocean'

    post '/oceans/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'

    get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'

    post '/oceans/:id' => 'oceans#update'

    get '/mountains' => 'mountains#index'

    get '/mountains/new' => 'mountains#new'

    post '/mountains' => 'mountains#create'

    get '/mountains/:id' => 'mountains#show', :as => 'mountain'

    post '/mountains/:id/delete' => 'mountains#destroy', :as => 'mountain_delete'

    get '/mountains/:id/edit' => 'mountains#edit', :as => 'mountain_edit'

    post '/mountains/:id' => 'mountains#update'

end
