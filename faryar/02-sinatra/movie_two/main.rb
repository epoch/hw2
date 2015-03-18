require 'sinatra'
# require 'sinatra/reloader'
require 'json'
require 'httparty'

get '/' do 
    erb :movie
end 

get '/search' do 
    search_keyword = params[:movie]
    search_slug = search_keyword.downcase.strip.gsub(/\s/, '+')
    search_url = "http://www.omdbapi.com/?s=#{search_slug}"
    @result = JSON.parse(HTTParty.get("http://www.omdbapi.com/?s=#{search_slug}"))

    if @result['Response'] == 'False' 
        redirect "/error"
    end

    @info = params[:info] || []

   
    if @result['Search'].count == 1
        redirect "/result?imdbID=#{ @result['Search'][0]['imdbID']}"
    end
    erb :search
end 


get '/result' do 
    @film = JSON.parse(HTTParty.get("http://www.omdbapi.com/?i=#{ params[:imdbID] }"))
    
    @info = params[:info] || ['Year','Rated','Rated','Runtime','Genre','Director','Actor','Country','imdbRating','Type','Awards']

    erb :result   
end 

get '/error' do 
    erb :error
end 






