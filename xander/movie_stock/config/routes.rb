Rails.application.routes.draw do
  
  root :to => 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/help' => 'pages#help'
  get '/faq' => 'pages#faq'

  get '/stock' => 'stock#stocksearch'
  get '/stock/result' => 'stock#stockresult'

  get '/movie' => 'movie#moviesearch'
  get '/movie/multiple' => 'movie#multiple'
  get '/movie/error' => 'movie#error'
  get '/movie/result' => 'movie#movieresult'

end
