require 'sinatra'
require 'sinatra/reloader'
require 'pry'

$subway_lines = {

    "N" => ["Times Square", "34th", "28th(N)", "23rd(N)", "Union Square", "8th(N)"],
    "L" => ["8th(L)", "6th", "Union Square", "3rd", "1st"],
    "6" => ["Grand Central", "33rd", "28th(6)", "23rd(6)", "Union Square", "Astor Place"]
}

get '/' do
    erb :mta2
end

get '/results' do

    @line_on = params[:line_on]

    @line_off = params[:line_off]

    @stop_on = params[:stop_on]

    @stop_off = params[:stop_off]
    
    @index_stop_on = $subway_lines[@line_on].index(@stop_on)

    @index_stop_off = $subway_lines[@line_off].index(@stop_off)

    @index_union_square_on = $subway_lines[@line_on].index("Union Square")

    @index_union_square_off = $subway_lines[@line_off].index("Union Square")

    # @changeover = "You need to change stations at Union Square"

    def stops(index_stop_on, index_stop_off, index_union_square_on, index_union_square_off)

        if @line_on == @line_off
            @num_stops = (@index_stop_off - @index_stop_on).abs
        else
            @stations_before_changeover = (@index_union_square_on - @index_stop_on).abs
            @stations_after_changeover = (@index_stop_off - @index_union_square_off).abs
            @num_stops = @stations_before_changeover + @stations_after_changeover
        end
        
    end
    @total_stops = stops(@index_stop_on, @index_stop_off, @index_union_square_on, @index_union_square_off)

    def stations(index_stop_on, index_stop_off, index_union_square_on, index_union_square_off)
        if @line_on == @line_off 
            if @index_stop_on < @index_stop_off
                @stations = $subway_lines[@line_on][@index_stop_on..@index_stop_off]
            else
                @stations = $subway_lines[@line_on][@index_stop_off..@index_stop_on]
                @stations = @stations.reverse
            end
        else
            if @index_stop_on < @index_union_square_on
                @stations_before_changeover_arr = $subway_lines[@line_on][@index_stop_on..@index_union_square_on]
            elsif @index_stop_on > @index_union_square_on
                @stations_before_changeover_arr = $subway_lines[@line_on][@index_union_square_on..@index_stop_on]
                @stations_before_changeover_arr = @stations_before_changeover_arr.reverse
            end
            if @index_stop_off < @index_union_square_off
                @stations_after_changeover_arr = $subway_lines[@line_off][@index_stop_off..@index_union_square_off]
                @stations_after_changeover_arr = @stations_after_changeover_arr.reverse
            elsif @index_stop_off > @index_union_square_off
                @stations_after_changeover_arr = $subway_lines[@line_off][@index_union_square_off..@index_stop_off]
            end
            @stations_after_changeover_arr.delete("Union Square")
        end
    end

    @all_stations = stations(@index_stop_on, @index_stop_off, @index_union_square_on, @index_union_square_off)

    if @line_on != @line_off 
        @changeover = true
    end 

    if @stop_on == @stop_off
        @already_at_destination = true
    end

    erb :results
end
