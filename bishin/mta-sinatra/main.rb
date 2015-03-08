require 'sinatra'
require 'sinatra/reloader'
require 'pry'

$directory = { 
:LineN => ["N-Time Square", "N-34th Street", "N-28th Street", "N-23rd Street", "N-Union Square", "N-8th Avenue"], 
:LineL => ["L-8th Avenue", "L-6th Avenue","L-Union Square", "L-3rd Avenue","L-1st Avenue"], 
:Line6 => ["6-Grand Central", "6-33rd Street", "6-28th Street", "6-23rd Street", "6-Union Square", "6-Astor Place"]
    } 
    
get '/' do
    erb :home
end

get '/result' do
    #line, station, index inputs
    @start_station=params[:start]
    @end_station=params[:end]
    @start_line=("Line"+@start_station[0,1]).to_sym
    @end_line=("Line"+@end_station[0,1]).to_sym
    @start_index =$directory[@start_line].index(@start_station)
    @end_index= $directory[@end_line].index(@end_station)
    @union_square_index=$directory[@start_line].index(@start_station[0,2].to_s+"Union Square")
    @union_square_end_index=$directory[@end_line].index(@end_station[0,2].to_s+"Union Square")
    
    def same_station
        if @start_station == @end_station
            true #return not necessary
        elsif @start_station.end_with?("Union Square") && @end_station.end_with?("Union Square")
            true
        end
    end
    @same_station= same_station

    def same_line
        if @start_index > @end_index
            stations = $directory[@start_line][@end_index..@start_index].reverse
        else
            stations = $directory[@start_line][@start_index..@end_index]    
        end
    end
    @same_line=same_line

    def first_leg
        if @start_index > @union_square_index
            stations = $directory[@start_line][@union_square_index..@start_index].reverse
        else
            stations = $directory[@start_line][@start_index..@union_square_index]
        end
    end
    @first_leg=first_leg

    def last_leg
        if @end_index > @union_square_end_index
            stations= $directory[@end_line][(@union_square_end_index+1)..@end_index]
        else
            stations= $directory[@end_line][@end_index..(@union_square_end_index-1)].reverse
        end
    end
    @last_leg=last_leg

    def stations_travelled
        @leg_one=[]
        @leg_two=[]

        if @same_station == true
            "you have already arrived at your destination" # no need to have puts
        elsif @start_line == @end_line
            @leg_one << @same_line
            @leg_one.flatten
        else
            @leg_one<< @first_leg
            @leg_two<< @last_leg
            (@leg_one+@leg_two).flatten
        end
    end
    @stations_travelled= stations_travelled ## make this code return the arrays above
    erb :result
end
