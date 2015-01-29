require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'youtube_addy'
require 'pry'

before do
    @genres = db_query('SELECT DISTINCT(genre) FROM videos')
end

get '/' do
    @genres = db_query('SELECT DISTINCT(genre) FROM videos')
    erb :home
end

get '/videos' do
    @videos = db_query("SELECT * FROM videos")
    erb :index
end

get '/videos/new' do
    erb :new
end

get '/videos/genre/:title' do
    @videos = db_query("SELECT * FROM videos WHERE genre='#{params[:title]}'")
    erb :index
end

post '/videos' do
    query = "INSERT INTO videos (title, genre, description, link) VALUES ('#{params["title"]}', '#{params["genre"]}', '#{params["description"]}', '#{params["link"]}')"
    db_query(query)
    redirect to('/videos')
end

get '/videos/:id' do
    id = params[:id]

    @video = db_query("SELECT * FROM videos WHERE id = #{id}")
    @video = @video.first

    @yt_embed = YouTubeAddy.extract_video_id(@video["link"])

    erb :show

end

get '/videos/:id/delete' do
    id = params[:id]
    db_query("DELETE FROM videos WHERE id = #{id}")
    redirect to ('/videos')
end

get '/videos/:id/edit' do
    id = params[:id]
    @video = db_query("SELECT * FROM videos WHERE id = #{id}").first
    erb :edit
end

post '/videos/:id' do
    id = params[:id]

    query = "UPDATE videos SET title='#{params["title"]}', genre='#{params["genre"]}', description='#{params["description"]}', link='#{params["link"]}' WHERE id=#{id}"
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
# 
# binding.pry