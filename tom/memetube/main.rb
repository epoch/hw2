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

####### shows the index page of all videos ###########

get '/videos' do
  @videos = db_query("SELECT * FROM videos")

  erb :index
end

###### generates list of genres #######

get '/videos/genre/:genre' do
    @videos = db_query("SELECT * FROM videos WHERE genre='#{params[:genre]}'")

    erb :index
end


###### Create/add new video ########

get '/videos/new' do
  erb :new
end

post '/videos' do
  # can only use single quotes atm, change params name thing to ' instead of  \" to switch around
  query = "INSERT INTO videos (name, description, url, genre) VALUES (\"#{params["name"]}\", '#{params["description"]}', '#{params["url"]}', '#{params["genre"]}')"

  db_query(query)

  redirect to('/videos')
end

###### Read/show the page for a video ############
###### Produce embed code ########################

get '/videos/:id' do
  id = params[:id]
  url = params[:url]

  @video = db_query("SELECT * FROM videos WHERE id = #{ id }")
  @video = @video.first

  @embed_code = YouTubeAddy.extract_video_id(@video["url"])

  erb :show
end

######## Delete ##########

get '/videos/:id/delete' do
  id = params[:id]

  db_query("DELETE FROM videos WHERE id = #{id}")
  redirect to('/videos')
end

######## Edit/Update ##########

get '/videos/:id/edit' do
  id = params[:id]

  @video = db_query("SELECT * FROM videos WHERE id = '#{id}'").first

  erb :edit
end

post '/videos/:id' do
  id = params[:id]

  query = "UPDATE videos SET name='#{params["name"]}', description='#{params["description"]}', url='#{params["url"]}', genre='#{params["genre"]}' WHERE id = #{id}"

  db_query(query)

  redirect to('/videos/' + id)
end

####### db query method ###############

def db_query(sql)
  db = SQLite3::Database.new "videos.db"
  db.results_as_hash = true

  result = db.execute sql
  db.close
  result
end