class MoviesController < ApplicationController
  def search
  end

  def options
    keyword = params[:keyword]
    url = "http://www.omdbapi.com/?s=#{keyword}"
    raw_data = HTTParty.get url
    search_data = JSON.parse raw_data
    @film_array = search_data['Search']
    if search_data["Error"]
      render '/movies/error'
    else
      @film_array = @film_array.select do |movie|
        movie['Type'] == 'movie'
      end
      if @film_array.length == 1
        redirect_to("/movies/poster?id=#{@film_array[0]['imdbID']}")
      else
        render '/movies/options'
      end
    end
  end

  def poster
    film_id = params[:id]
    id_url = "http://www.omdbapi.com/?i=#{film_id}"
    raw_data = HTTParty.get id_url
    film_data = JSON.parse raw_data
    @poster_data = film_data['Poster']
    @released = film_data['Released']
    @image_url = film_data['Poster']
    if film_data['Poster'] == "N/A"
        render '/movies/error'
    else
        render '/movies/poster'
    end
  end

  def error
  end
end