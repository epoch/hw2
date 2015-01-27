require 'sinatra'
require 'sinatra/reloader'
require 'pry'

subway_lines = {
    :N => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
    :L => ['8th', '6th', 'Union Square', '3rd', '1st'],
    :Six => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}

get '/' do
    erb :form
end

get '/result' do
    @journey = {}

    @journey[:origin_line], @journey[:origin] = params[:origin].split(' - ')
    @journey[:destination_line], @journey[:destination] = params[:destination].split(' - ')

    @origin = subway_lines[@journey[:origin_line].to_sym].index(@journey[:origin])
    @destination = subway_lines[@journey[:destination_line].to_sym].index(@journey[:destination])

    @origin_intersect = subway_lines[@journey[:origin_line].to_sym].index("Union Square")
    @destination_intersect = subway_lines[@journey[:destination_line].to_sym].index("Union Square")

    if @journey[:origin_line] == @journey[:destination_line]
        @num_stops = (@destination - @origin).abs
        if @origin < @destination
            stops = subway_lines[@journey[:origin_line].to_sym].values_at(@origin..@destination)
            @stops = stops.join(', ')
        elsif @origin > @destination
            stops = subway_lines[@journey[:origin_line].to_sym].values_at(@destination..@origin).reverse
            @stops = stops.join(', ') 
        end
    else
        if @origin > @destination
            origin_stops = @origin_intersect - @origin
            destination_stops = @destination - @destination_intersect
            @num_stops = (origin_stops + destination_stops).abs
        elsif @origin < @destination
            origin_stops = @origin - @origin_intersect
            destination_stops = @destination_intersect - @destination
            @num_stops = (origin_stops + destination_stops).abs 
        elsif @origin == @destination
            origin_stops = @origin - @origin_intersect
            destination_stops = @destination - @destination_intersect
            @num_stops = (origin_stops + destination_stops).abs 
        end
    end
    # binding.pry
    erb :result
end
