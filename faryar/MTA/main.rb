require 'sinatra'
require 'sinatra/reloader'


get '/' do 
    @subway = { 
        "N" => ["TIMES SQUARE", "34TH", "28TH (N)", "23RD (N)", "UNION SQUARE", "8TH (N)"], 
        "L" => ["8TH (L)", "6TH", "UNION SQUARE", "3RD", "1ST"],
        "6" => ["GRAND CENTRAL", "33RD", "28TH (6)", "23RD (6)", "UNION SQUARE", "ASTOR PLACE"],
        }
    erb :MTA
end 

get '/result' do 
    # the subway lines and stations array is below 
    @subway = { 
        "N" => ["TIMES SQUARE", "34TH", "28TH (N)", "23RD (N)", "UNION SQUARE", "8TH (N)"], 
        "L" => ["8TH (L)", "6TH", "UNION SQUARE", "3RD", "1ST"],
        "6" => ["GRAND CENTRAL", "33RD", "28TH (6)", "23RD (6)", "UNION SQUARE", "ASTOR PLACE"],
        }

    # taking the params from the form and setting it to variables (with hats on top)
    @line_start = params[:line_start]
    @line_end = params[:line_end]
    @station_start = params[:station_start]
    @station_end = params[:station_end]

    # the indexes below are to help me with displaying each station that the passenger passes through 
    @index_first_start = @subway[@line_start].index(@station_start).to_i
    @index_first_end = @subway[@line_start].index(@station_end).to_i
    @index_first_union = @subway[@line_start].index("UNION SQUARE").to_i
    @index_second_union = @subway[@line_end].index("UNION SQUARE").to_i
    @index_second_end = @subway[@line_end].index(@station_end).to_i


     # variables below are for my functions for displaying the stations that the passenger passes through if they are on a different line 
    @different_line_one = @subway[@line_start][@index_first_start..@index_first_union]
    @different_line_two = @subway[@line_start][@index_first_union..@index_first_start].reverse
    @different_line_three = @subway[@line_end][@index_second_union..@index_second_end]
    @different_line_four = @subway[@line_end][@index_second_end..@index_second_union].reverse



    # the if statement below is for displaying the stations that the passenger pases through if they are on different lines 
    if  @index_first_union > @index_first_start && @index_second_union > @index_second_end
        @different_solution = @different_line_one + @different_line_four
    elsif @index_first_union > @index_first_start && @index_second_union < @index_second_end
        @different_solution = @different_line_one + @different_line_three
    elsif @index_first_union < @index_first_start && @index_second_union > @index_second_end
        @different_solution = @different_line_two + @different_line_four
    else 
        @different_solution = @different_line_two + @different_line_three
    end 
        


    # the if statement below is for displaying the stations that the passenger pases through if they are on the same line 
    if @index_first_end > @index_first_start
        @same_solution = @subway[@line_start][@index_first_start..@index_first_end]
    else 
        @same_solution = (@subway[@line_start][@index_first_end..@index_first_start]).reverse
    end


     # my equation when the starting and end station are the same 
    if @line_start == @line_end && @station_start == @station_end
        @same_station = "You are already at #{@station_end}."


        erb :error
    # my equation when the starting line and ending line are the same 
    elsif @line_start[0] == @line_end[0]
        @result = "#{@station_end} is #{(@subway[@line_start].index(@station_start).to_i - @subway[@line_end].index(@station_end).to_i).abs} stop(s) away on Line #{@line_end}. Have a nice day!"

        erb :sameline
    else 
    # my equation when the starting line and ending line are different 
        @result = "#{ @station_end } is #{(@subway[@line_start].index(@station_start).to_i - @subway[@line_start].index("UNION SQUARE").to_i).abs + (@subway[@line_end].index("UNION SQUARE").to_i - @subway[@line_end].index(@station_end).to_i).abs} stop(s) away. You will have to transfer at Union Square in #{(@subway[@line_start].index(@station_start).to_i - @subway[@line_start].index("UNION SQUARE").to_i).abs} stop(s) and then it is #{(@subway[@line_end].index("UNION SQUARE").to_i - @subway[@line_end].index(@station_end).to_i).abs} stop(s) away on Line #{@line_end}. Have a nice day!"

        erb :differentline
    end


end 

get '/sameline' do 
    erb :sameline
end 

get '/differentline' do
    erb :differentline
end