Rails.application.routes.draw do
  # Static pages in my pages controller:
  root :to => "pages#home" # Assign the 'homepage'
  get "/home" => "pages#home" # Homepage
  get "/stock" => "stock#stock_search" # Stock search
  get "/movie" => "movie#movie_search" # Movie search
  get "/about" => "about#about" # About page
  get "/faq" => "faq#faq" # FAQ page
end
