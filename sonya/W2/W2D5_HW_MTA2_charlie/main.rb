require 'sinatra'
require 'sinatra/reloader'
require 'pry'

before do
    @subway_lines = {
        "line_N" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],            
        "line_L" => ["8th", "6th", "Union Square", "3rd", "1st"],
        "line_6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
        }
end

get '/' do 
    erb :home
end

post '/trip' do
    @end_details = (@subway_lines[params["end_line"]].index(params["end_station"])).abs
    @start_details = @subway_lines[params["start_line"]].index(params["start_station"]).abs
    @stops = (@end_details) - (@start_details)
    @stops2 = @subway_lines[params[:start_line]].index("Union Square") - @start_details.abs + @subway_lines[params[:end_line]].index("Union Square") - @end_details.abs

    erb :trip
end

get '/trip' do
    erb :trip
end