require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'

get '/' do
    erb :movie_poster
end
# this is saying in the event of a get request for this forward slash this is what i want you to do

get '/poster' do

    title = params[:title].gsub(/\s/,'+')

    url = "http://www.omdbapi.com/?t=#{title}"

    raw_data = HTTParty.get url

    movie_data = JSON.parse raw_data

    @image_url = movie_data['Poster']

    if movie_data["Error"] || movie_data["Poster"] == "N/A"
        erb :error
    else
        erb :poster_displayed
    end

end