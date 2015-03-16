require 'sinatra'
# require 'sinatra/reloader'

get '/multiply/:x/:y' do 
	@result = params[:x].to_f * params[:y].to_f # need to put a hat on it to make it more important (this is important enought to be accessible in a different file)
	erb :calc # matches up with file calc (using symbol instead of string because it saves memory)
end 

get '/add/:x/:y' do 
	@result = params[:x].to_f + params[:y].to_f
	erb :calc
end 

get '/calc' do 
    @first = params[:first].to_f
    @second = params[:second].to_f


    @result = case params[:operator]
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
    erb :calc

     
end




