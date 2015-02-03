require "sinatra"
require "sinatra/reloader"

get "/" do
  @groudcho = "excellent"
  @kitten = ""

  # @debug_mode = params[:debug]
  @debug_mode = true

  erb :demo
end
