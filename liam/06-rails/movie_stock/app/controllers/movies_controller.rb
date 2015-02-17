class MoviesController < ApplicationController
  
  def search
    
  end

  def search_results
    search_keyword = params[:keyword].to_s
    search_slug = search_keyword.downcase.strip.gsub(/\s/, '+')
    search_url = "http://www.omdbapi.com/?s=#{search_slug}"
    raw_search_data = HTTParty.get search_url
    @search_data = JSON.parse raw_search_data

    if search_keyword == ""
      render :search_error
    elsif @search_data["Response"] == "False"
      render :search_error
    elsif @search_data["Search"].count == 1
      redirect "/movies/" + @search_data["Search"][0]["imdbID"]
    else
      render :search_results
    end
  end

  def movie_listing
    id = params[:id]
    movie_url = "http://www.omdbapi.com/?i=#{id}"
    raw_movie_data = HTTParty.get movie_url
    @movie_data = JSON.parse raw_movie_data

    render :movie_listing
  end
  
end