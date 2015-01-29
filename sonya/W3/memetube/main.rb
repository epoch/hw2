require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'uri'
require 'youtube_addy'

require 'pry'

before do 
    @genres = db_query("SELECT DISTINCT(genre) FROM memetube")
end

get '/' do
    erb :home    
end

# STEP 1: Index aka READ
get '/memetube' do
    @memetube = db_query("SELECT * FROM memetube")

    erb :index
end

get '/memetube/genre/:title' do
    @memetube = db_query("SELECT * FROM memetube WHERE genre='#{params[:genre]}'")
    erb :index
end

# STEP 3: Form to add
get '/memetube/new' do
    erb :new
end

post '/memetube' do
    query = "INSERT INTO memetube (title, description, url, genre) VALUES ('#{params["title"]}', '#{params["description"]}', '#{params["url"]}', '#{params["genre"]}')"
    
    db_query(query)

    redirect to('/memetube')
end

# STEP 2: Index of memes
get '/memetube/:id' do
    id = params[:id]

    @meme = db_query("SELECT * FROM memetube WHERE id = #{ id }")
    @meme = @meme.first

    @embed_code = YouTubeAddy.extract_video_id(@meme["url"])

    erb :show
end

# STEP 4: Delete
get '/memetube/:id/delete' do
    id = params[:id]

    db_query("DELETE FROM memetube WHERE id = #{ id }")

    redirect ('/memetube')
end

# STEP 5: Update

get '/memetube/:id/edit' do
    id = params[:id]

    @meme = db_query("SELECT * FROM memetube WHERE id = #{ id }").first

    erb :edit
end

post '/memetube/:id' do
    id = params[:id]

    query = "UPDATE memetube SET title='#{params["title"]}', description='#{params["description"]}', url='#{params["url"]}', genre='#{params["genre"]}' WHERE id = #{ id }"

    db_query(query)

    redirect to ('/memetube/' + id)
end

# DATABASE METHOD
def db_query(sql)
    db = SQLite3::Database.new "memetube.db"
    db.results_as_hash = true

    result = db.execute sql
    db.close
    result
end