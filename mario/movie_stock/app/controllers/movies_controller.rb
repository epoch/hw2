class MoviesController < ApplicationController

  def search
  end

  def process_results
    movie, year = params[:query], params[:year]
    movie = movie.downcase.strip.gsub(/\s/, '+')
    url = "http://omdbapi.com/?s=#{ movie }&y=#{ year }"
    raw_data = HTTParty.get url
    parsed_data = JSON.parse raw_data
    @search_results = parsed_data["Search"]
    if parsed_data['Error']
        puts parsed_data['Error']
        render '/movies/error'
    elsif @search_results.size == 1
        imdbid = @search_results[0]["imdbID"]
        redirect_to("/movies/get_poster?imdbid=#{ imdbid }")
    else
        @search_results
        render 'movies/search_results'
    end
  end

  def get_poster
    imdbid = params[:imdbid]
    url = "http://omdbapi.com/?i=#{ imdbid }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
    if @movie_data['Error']
        render '/movies/error'
    else
        render '/movies/result'
    end
  end

end