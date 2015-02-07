Rails.application.routes.draw do
  # Static pages
  root :to => 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'

  # Movies
  get '/movies' => 'movies#search'
  get '/movies/search' => 'movies#search_results'
  get '/movies/:id' => 'movies#movie_listing'

  # Stocks
  get '/stocks' => 'stocks#search'
  get '/stocks/search' => 'stocks#stock_results'

end
