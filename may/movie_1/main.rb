require "sinatra"
require "sinatra/reloader"
require "httparty"
require "Json"


get '/' do 
    erb :forms
end

get '/result' do
    @title = params[:title] 
    url = "http://www.omdbapi.com/?t=#{@title}"
    raw_date = HTTParty.get(url)
    movie_date=JSON.parse raw_date
    if movie_date['Response'] == "False"
        @poster = nil
    else
        @poster = movie_date['Poster']
    end
    erb :result
end



