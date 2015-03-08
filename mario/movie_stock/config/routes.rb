Rails.application.routes.draw do
  
  get '/stock/' => 'stock#index'
  get '/stock/lookup' => 'stock#lookup'
  get '/stock/result' => 'stock#result'

  get '/movies/' => 'movies#search'
  get '/movies/process' => 'movies#process_results'
  get '/movies/get_poster' => 'movies#get_poster'

end
