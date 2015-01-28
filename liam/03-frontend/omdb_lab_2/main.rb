require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'
require 'pry'

get '/' do
  erb :search
end

get '/search' do
  search_keyword = params[:keyword]
  search_slug = search_keyword.downcase.strip.gsub(/\s/, '+')
  search_url = "http://www.omdbapi.com/?s=#{search_slug}"
  raw_search_data = HTTParty.get search_url
  @search_data = JSON.parse raw_search_data

  # binding.pry

  if search_keyword == ""
    erb :error_search
  elsif @search_data["Response"] == "False"
    erb :error_search
  elsif @search_data["Search"].count == 1
    redirect "/results?id=" + @search_data["Search"][0]["imdbID"]
  else
    erb :search_list
  end
end

get '/results' do

  id = params[:id]
  movie_url = "http://www.omdbapi.com/?i=#{id}"
  raw_movie_data = HTTParty.get movie_url
  @movie_data = JSON.parse raw_movie_data

  if @movie_data["Error"] == "N/A" || @movie_data["Poster"] == "N/A"
    erb :error_poster
  else
    erb :movie_result
  end

end