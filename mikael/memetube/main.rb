require "sinatra"
require "sinatra/reloader"
require "sqlite3"

require "pry"

# @butterflies = @youtube
# @video = @video
# @families = @genres
# family = genre

before do
  @genres = db_query("SELECT DISTINCT(genre) FROM youtube")
end

get "/" do
  erb :home
end

get "/youtube" do
  @youtube = db_query("SELECT * FROM youtube")
  erb :index
end

get "/youtube/genre/:name" do
  @youtube = db_query("SELECT * FROM youtube WHERE genre='#{params[:name]}'")
  erb :index
end

get "/youtube/new" do
  erb :new
end

post "/youtube" do
  query = "INSERT INTO youtube (name, genre, video) VALUES ('#{params["name"]}', '#{params["genre"]}', '#{params["video"]}')"
  db_query(query)
  redirect to("/youtube")
end

get "/youtube/:id" do
  id = params[:id]

  @video = db_query ("SELECT * FROM youtube WHERE id = #{ id }")
  @video = @video.first

  erb :show
end

get "/youtube/:id/delete" do
  id = params[:id]

  db_query("DELETE FROM youtube WHERE id = #{id}")

  redirect to("/youtube")
end

get "/youtube/:id/edit" do
  id = params[:id]

  @video = db_query("SELECT * FROM youtube WHERE id = #{id}").first

  erb :edit
end

post "/youtube/:id" do
  id = params[:id]

  query = "UPDATE youtube SET name='#{params["name"]}', genre='#{params["genre"]}', video='#{params["video"]}' WHERE id = #{id}"

  db_query(query)

  redirect to("/youtube/" + params[:id])
end

def db_query(sql)
  db = SQLite3::Database.new "youtube.db"
  db.results_as_hash = true

  result = db.execute sql
  
  db.close
  result
end




