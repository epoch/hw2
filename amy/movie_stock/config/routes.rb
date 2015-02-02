Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
  get '/help' => 'pages#help'


  get '/movie' => 'movie#movie'
  get '/movie/options' => 'movie#options'
  get '/movie/options/:title' => 'movie#options'
  get '/movie/poster' => 'movie#poster'
  get '/movie/poster/:id' => 'movie#poster'
  get '/movie/poster/movie_error' => 'movie#movie_error'
  get '/movie/poster/poster_error' => 'movie#poster_error'

  get '/stock' => 'stock#stock'
  get '/stock/:stock_symbol' => 'stock#stock'

  get '/games' => 'games#games'
  get '/games/magic_8_ball' => 'games#magic_8_ball'
  get '/games/magic_8_ball_answer' => 'games#magic_8_ball_answer'
  get '/games/secret_number' => 'games#secret_number'
  get '/games/secret_number_result' => 'games#secret_number_result'
  # get '/games/secret_number/secret_number_win' => 'games#secret_number_win'
  # get '/games/secret_number/secret_number_lose' => 'games#secret_number_lose'
  get '/games/rock_paper_scissors' => 'games#rock_paper_scissors'
  get '/games/rock_paper_scissors_result' => 'games#rock_paper_scissors_result'

end

# if someone makes a get request to /home
# go and look in our pages controller and go and find the method called home