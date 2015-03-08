Rails.application.routes.draw do

  root :to => 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'

  get '/stock' => 'stock#lookup'

  get '/movie' => 'movie#lookup'
  get '/movie/:id' => 'movie#movie_id'

end
