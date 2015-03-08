require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'uri'

require 'pry'
before do
    @genres = db_query("SELECT DISTINCT(genre) FROM memetube")
end

get '/' do
    erb :home
end

get '/memetube' do
    @videos = db_query("SELECT * FROM memetube")
    erb :index
end

get '/memetube/genre/:title' do
    @videos = db_query("SELECT * FROM memetube WHERE genre='#{params[:title]}'")
    erb :index
end

get '/memetube/new' do
    erb :new
end

post '/memetube' do
    query = "INSERT INTO memetube (title, url, genre, description) VALUES ('#{params["title"]}', '#{params["url"]}', '#{params["genre"]}', '#{params["description"]}')"

    db_query(query)

    redirect to('/memetube')
end

get '/memetube/:id' do
    id = params[:id]

    @video = db_query("SELECT * FROM memetube WHERE id = #{id}")
    @video = @video.first

    erb :view
end

get '/memetube/:id/delete' do
    id = params[:id]

    db_query("DELETE FROM memetube WHERE id = #{id}")

    redirect to('/memetube')
end

get '/memetube/:id/edit' do
    id = params[:id]

    @video = db_query("SELECT * FROM memetube WHERE id = #{id}").first

    erb :edit
end

post '/memetube/:id' do
    id = params[:id]

    query = "UPDATE memetube SET name='#{params["title"]}', '#{params["url"]}', '#{params["genre"]}', '#{params["description"]}'"

    db_query(query)

    redirect to('/memetube' + id)
end

def db_query(sql)
    db = SQLite3::Database.new "memetube.db"
    db.results_as_hash = true

    result = db.execute sql
    db.close
    result
end