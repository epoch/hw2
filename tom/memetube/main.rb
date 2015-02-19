require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'youtube_addy'
require 'active_record'

require_relative 'video'

ActiveRecord::Base.logger = Logger.new(STDERR) # show SQL in the terminal.

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'videos.db'
)

before do
  @genres = Video.select(:genre).uniq
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :home
end

####### shows the index page of all videos ###########

get '/videos' do
  @videos = Video.order(:name)
  erb :index
end

###### generates list of genres #######

get '/videos/genre/:genre' do
    @videos = Video.where(:genre => params[:genre]).order(:name)
    erb :index
end

###### Create/add new video ########

get '/videos/new' do
  erb :new
end

post '/videos' do
  video = Video.create(:name => params[:name], :description => params[:description], :url => params[:url], :genre => params[:genre])
  redirect to("/videos/#{ video.id }")
end

###### Read/show the page for a video ############
###### Produce embed code ########################

get '/videos/:id' do
  @video = Video.find params[:id]
  @embed_code = YouTubeAddy.extract_video_id(@video.url)
  erb :show
end

######## Delete ##########

get '/videos/:id/delete' do
  video = Video.find params[:id]
  video.destroy
  redirect to('/videos')
end

######## Edit/Update ##########

get '/videos/:id/edit' do
  @video = Video.find params[:id]
  erb :edit
end

post '/videos/:id' do
  video = Video.find params[:id]
  video.update(:name => params[:name], :description => params[:description], :url => params[:url], :genre => params[:genre])
  redirect to("/videos/#{ video.id }")
end
