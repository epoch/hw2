require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'youtube_addy'
require 'pry'

def parse_youtube(url)   
    regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
    url.match(regex)[1]
end


before do 
    @genres = db_query("SELECT DISTINCT(genre) FROM memes")
end

get '/' do 
    erb :home
end

get '/memes' do 
    @memes = db_query("SELECT * FROM memes")

    erb :index
end

get '/memes/genre/:title' do 
    @memes = db_query("SELECT * FROM memes WHERE genre='#{params[:title]}'")

    erb :index
end

get '/memes/new' do 
    erb :new
end

post '/memes' do 

    query = "INSERT INTO memes (title, description, url, genre) VALUES ('#{params["title"]}', '#{params["description"]}', '#{params["url"]}', '#{params["genre"]}')"

        db_query(query)
        redirect to('/memes')
end

get '/memes/:id' do 
    
    id = params[:id]

    @youtube_id = parse_youtube(params[:url])
    binding.pry
    @youtube = "http://www.youtube.com/embed/" + @youtube_id

    @meme = db_query("SELECT * FROM memes WHERE id = #{id}")
    @meme = @meme.first

    erb :show
end

get '/memes/:id/delete' do 
    id = params[:id]

    db_query("DELETE FROM memes WHERE id = #{id}")

    redirect to('/memes')

end

get '/memes/:id/edit' do 
    id = params[:id]

    @meme = db_query("SELECT * FROM memes WHERE id = #{id}").first

    erb :edit
end

post '/memes/:id' do

    id = params[:id]
    query = "UPDATE memes SET title='#{params["title"]}', description='#{params["description"]}', url='#{params["url"]}', genre='#{params["genre"]}' WHERE id = #{id}"

    db_query(query)

    redirect to('/memes/' + id)
end

def db_query(sql)
    db = SQLite3::Database.new "memes.db"
    db.results_as_hash = true

    result = db.execute sql
    
    db.close
    result
end


