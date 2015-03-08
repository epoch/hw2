Rails.application.routes.draw do
  # Static pages in my home controller:
  root :to => "home#home" # Assign the 'homepage'
  get "/home" => "home#home" # Homepage
  get "/stock" => "stock#stock_search" # Stock search
  get "/movie" => "movie#movie_search" # Movie search
  get "/about" => "about#about" # About page
  get "/faq" => "faq#faq" # FAQ page
end
