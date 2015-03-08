require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do  

    erb :trip_plan

end

get '/directions' do

    lines = {   
        "N" => ["8th", "Union Square", "23rd", "28th", "34th", "Times Square"],
        "L" => ["1st", "3rd", "Union Square", "6th", "8th"],
        "6" => ["Astor Place", "Union Square", "23rd", "28th", "33rd", "Grand Central"]
    }

    params[:current]
    params[:destination]

    current = params[:current].split('-')
    destination = params[:destination].split('-')

    @current_line = current[0]
    @current_station = current[1]
    @destination_line = destination[0]
    @destination_station = destination[1]

# Determine which stations are passed on journey if there is no line change.
    if @current_line == @destination_line 

         start_index = lines[@current_line].index(@current_station)
         finish_index = lines[@destination_line].index(@destination_station)

        if start_index < finish_index
            stations_passed = lines[@current_line][start_index..finish_index]
        else
            stations_passed = lines[@current_line][finish_index..start_index]
            stations_passed = stations_passed.reverse    
        end

        @stops = stations_passed

        @change_lines = "You will not be required to change lines on this journey"

# Determine which stations are passed on journey when there is a line change.
    else

        current_start_index = lines[@current_line].index(@current_station) 
        current_union_square = lines[@current_line].find_index("Union Square")
        destination_union_square = lines[@destination_line].find_index("Union Square")
        destination_finish_index = lines[@destination_line].index(@destination_station)  

        if current_start_index < current_union_square
            @current_stations_passed = lines[@current_line][current_start_index..current_union_square]

        else

            @current_stations_passed = lines[@current_line][current_union_square..current_start_index]
            @current_stations_passed = @current_stations_passed.reverse

        end 

        if destination_finish_index < destination_union_square
            
            @destination_stations_passed = lines[@destination_line][destination_finish_index..(destination_union_square - 1)]
            @destination_stations_passed = @destination_stations_passed.reverse
        else
            @destination_stations_passed = lines[@destination_line][(destination_union_square + 1)..destination_finish_index]
            
        end
        
        @stops = @current_stations_passed + @destination_stations_passed  

        @change_lines = "You will be required to change to Line #{ @destination_line }, at Grand Central station."

    end 

    @number_of_stops = (@stops.count) - 1

    erb :directions

end
