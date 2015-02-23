Rails.application.routes.draw do
  # STATIC views/pages
  root :to => 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/help' => 'pages#help'
  get '/faq' => 'pages#faq'
  
  # STOCKS views/pages
  get '/stocks' => 'stocks#lookup'
  get '/stocks/lookup' => 'stocks#lookup'
  get '/stocks/lookup/:stock_symbol' => 'stocks#lookup'
  
  # MOVIES views/pages
  get '/movies' => 'movies#search'
  get '/movies/search' => 'movies#search'
  get '/movies/options' => 'movies#options'
  get '/movies/options/:keyword' => 'movies#options'
  get '/movies/poster' => 'movies#poster'
  get '/movies/poster/:id' => 'movies#poster'
  get '/movies/error' => 'movies#error'

  # GAMES views/pages
  get '/games' => 'games#home'
  get '/games/magic_ball' => 'games#magic_ball'
  get '/games/magic_ball/:question' => 'games#magic_result'
  get '/games/secret_number' => 'games#secret_number'
  get '/games/secret_number/:number' => 'games#secret_number'
  get '/games/rock_paper_scissors' => 'games#rock_paper_scissors'
  get '/games/rock_paper_scissors/:throw' => 'games#rock_paper_scissors'
end
