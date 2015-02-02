require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'youtube_addy'

before do
    @genres = db_query("SELECT DISTINCT(genre) FROM videos")
end

get '/' do 
    erb :home
end

get '/videos' do
    @videos = db_query("SELECT * FROM videos")
    erb :index
end

get '/videos/new' do
    erb :new
end

get '/videos/:id' do
    id = params[:id]

    @video = db_query "SELECT * FROM videos WHERE id = #{ id }"
    @video = @video.first

    @embedded_url = YouTubeAddy.extract_video_id(@video["url"])

    erb :show
end

post '/videos' do
    params["title"].gsub!('"', '""')
    query = "INSERT INTO videos (title, genre, url) VALUES (\"#{params["title"]}\",'#{params["genre"]}','#{params["url"]}')"   
    db_query(query)
    redirect to('/videos')
end

get '/videos/:id/delete' do
    id = params[:id]
    db_query("DELETE FROM videos WHERE id = #{ id }")
    redirect to('/videos')
end

get '/videos/:id/edit' do
    id = params[:id]
    @video = db_query("SELECT * FROM videos WHERE id = #{ id }").first
    erb :edit
end

post '/videos/:id' do
    id = params[:id]

    query = "UPDATE videos SET title='#{params["title"]}', genre='#{params["genre"]}', url='#{params["url"]}' WHERE id = #{id}"
    db_query(query)
    redirect to('/videos/' + params[:id])
end


def db_query(sql)
    db = SQLite3::Database.new "videos.db"
    db.results_as_hash = true

    result = db.execute sql
    db.close
    result
end