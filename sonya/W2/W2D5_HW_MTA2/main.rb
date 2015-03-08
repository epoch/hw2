require 'sinatra'
require 'sinatra/reloader'

# REST = HTTP methods GET, POST, PUT and DELETE
# REST URLs represent resources and not actions
# Before filters are evaluated before each request within the same context as the routes.
# Before filters can modify the request and response. 
# Me: before block applies hash to all pages before the the program does anything:

before do
    @subway_lines = {
        "line_N" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
        "line_L" => ["8th", "6th", "Union Square", "3rd", "1st"],
        "line_6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
    }
end

get '/' do
    erb :form
end

# Sinatra assumes resources for safe (like get) and unchanged (like put) requests are already in existence, whereas other resources (i.e post requests) are treated as new resources

# DO SAME LINE MATH
# DO TO UNION SQ MATH
# DO ADDING/SUBRACTING CHANGED LINE
# DO COUNT ARRAY RANGE INDEX WITH REVERSE

get '/trip' do
    @end_details = (@subway_lines[params["end_line"]].index(params["end_station"])).abs
    @start_details = @subway_lines[params["start_line"]].index(params["start_station"]).abs
    @stops = (@end_details) - (@start_details)
    @stops2 = @subway_lines[params[:start_line]].index("Union Square") - @start_details.abs + @subway_lines[params[:end_line]].index("Union Square") - @end_details.abs

    erb :trip
end

# get '/trip' do
#     erb :trip
# end