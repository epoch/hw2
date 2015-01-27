require 'sinatra'
require 'sinatra/reloader'

get '/' do
   erb :journey_planner
end

get '/directions' do

  lines = {
    'N' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '3rd', '1st'],

    'L' => ['8th', '6th', 'Union Square', '3rd', '1st'],

    '6' => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
  }

  # N-times sq will be stored in user_line
  # bear in mind that the lines are CAPITAL LETTERS!

  current = params[:user_line].split('-')
  destination = params[:end_line].split('-')

  # this finds the start and end line, and the start and end station in the form of STRINGS
  @current_line = current[0]
  @current_station = current[1]
  @destination_line = destination[0]
  @destination_station = destination[1]

  if @current_line == @destination_line
    @total_stops = ((lines[@current_line].index(@current_station)) - (lines[@destination_line].index(@destination_station))).abs

  else
    stops_to_union_square = (lines[@current_line].index(@current_station) - lines[@current_line].find_index("Union Square")).abs
    stops_from_union_square = (lines[@destination_line].index(@destination_station) - lines[@destination_line].find_index("Union Square")).abs
    @total_stops = (stops_to_union_square + stops_from_union_square)
  end


  # if the starting stop, or the finishing stop, is Union Square then we need to force it to take a single journey on one line
  if @current_station == "Union Square"

    @current_line = @destination_line

  end

  if @destination_station == "Union Square"

    @destination_line = @current_line

  end
  ############ single line journey #####################

  if @current_line == @destination_line

  @stops = []
  @reverse_array = []

  # going forwards...
  if (lines[@current_line].index(@current_station)) < (lines[@current_line].index(@destination_station))

    lines[@current_line].each_with_index do |v, i|
      # if it's in the range
      if i > (lines[@current_line].index(@current_station)) && i < (lines[@current_line].index(@destination_station))
        @stops << v
      end
    end

  # going backwards...
  else
    lines[@current_line].each_with_index do |v, i|
      if i < (lines[@current_line].index(@current_station)) && i > (lines[@current_line].index(@destination_station))
        @reverse_array << v
      end
    end

    @reverse_array.reverse!

    @reverse_array.each do |v|
      @stops << v
    end

  end

  puts "ending at #{@destination_station}"

  ########## 2 leg journey #########################

  else # if the journey goes over 2 lines

    @stops = []
    @stops2 = []
    @reverse_array = []
    @reverse_array2 = []

    puts "Starting at #{@current_station}"

    ########## first leg forwards and backwards #############

    # if we're going forwards...
    if (lines[@current_line].index(@current_station)) < (lines[@current_line].index("Union Square"))

      lines[@current_line].each_with_index do |v, i|
        # if it's in the range between the starting station and the interchange
        if (lines[@current_line].index(@current_station)) < (lines[@current_line].index("Union Square"))
          if i > (lines[@current_line].index(@current_station)) && i < (lines[@current_line].index("Union Square"))
            @stops << v
          end
        end
      end

    # else if we're going backwards...
    else

      lines[@current_line].each_with_index do |v, i|
        # if the station is between the interchange and the start point
        if i < (lines[@current_line].index(@current_station)) && i > (lines[@current_line].index("Union Square"))
          @reverse_array << v
        end
      end

      @reverse_array.reverse!

      @reverse_array.each do |v|
          @stops << v
      end

    end

    ####### second leg forwards and backwards ############

    # if we're going forwards...
    if (lines[@destination_line].index("Union Square")) < (lines[@destination_line].index(@destination_station))

      lines[@destination_line].each_with_index do |v, i|
        if i > (lines[@destination_line].index("Union Square")) && i < (lines[@destination_line].index(@destination_station))
          @stops2 << v
        end
      end

    # else if we're going backwards...
    else

      lines[@destination_line].each_with_index do |v, i|
        # if the station is between the interchange and the end point
        if i < (lines[@destination_line].index("Union Square")) && i > (lines[@destination_line].index(@destination_station))
          @reverse_array2 << v
        end

      end

      @reverse_array2.reverse!

      @reverse_array2.each do |v|
          @stops2 << v
      end

    end

  end

  erb :directions
end