require 'pry'

lines = {
    'N' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '3rd', '1st'],

    'L' => ['8th', '6th', 'Union Square', '3rd', '1st'],

    '6' => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
  }

puts lines.keys
print "Which line are you on?: "
current_line = gets.chomp

puts lines[current_line]
print "Which station are you at?: "
current_station = gets.chomp

puts lines.keys
print "What is your destination line?: "
destination_line = gets.chomp

puts lines[destination_line]
print "What is your destination station?: "
destination_station = gets.chomp

stops_to_union_square = (lines[current_line].index(current_station) - lines[current_line].find_index("Union Square")).abs
stops_from_union_square = (lines[destination_line].index(destination_station) - lines[destination_line].find_index("Union Square")).abs
total_stops = (stops_to_union_square + stops_from_union_square)


# only add this to sinatra for formatting purposes in the view
# only if necessary!
if current_line == destination_line
  puts "total stops = #{total_stops}"
else
  puts "#{stops_to_union_square} stops to Union Square"
  puts "Change at Union Square"
  puts "#{stops_from_union_square} stops from Union Square to destination"
  puts "total stops = #{total_stops}"
end

# the above can successfully calculate the stop count between lines


############## single line journey #####################

if current_line == destination_line
  puts "Starting at #{current_station}"

 # reverse array for second leg?
  reverse_array = []
  # going forwards
  if (lines[current_line].index(current_station)) < (lines[current_line].index(destination_station))

    lines[current_line].each_with_index do |v, i|
      # if it's in the range
      if i > (lines[current_line].index(current_station)) && i < (lines[current_line].index(destination_station))
        puts "You will pass " + v
      end
    end

  else
    lines[current_line].each_with_index do |v, i|
      if i < (lines[current_line].index(current_station)) && i > (lines[current_line].index(destination_station))
        reverse_array << v
      end
    end

    reverse_array.reverse!

    reverse_array.each do |v|
      puts "You will pass " + v
    end

  end

  puts "ending at #{destination_station}"

  ########## 2 leg journey #########################

else # if the journey goes over 2 lines

  reverse_array = []
  reverse_array2 = []

  puts "Starting at #{current_station}"

  ########## first leg forwards and backwards (get the fuck in!) #############

  # if we're going forwards...
  if (lines[current_line].index(current_station)) < (lines[current_line].index("Union Square"))

    lines[current_line].each_with_index do |v, i|
      # if it's in the range between the starting station and the interchange
      if (lines[current_line].index(current_station)) < (lines[current_line].index("Union Square"))
        if i > (lines[current_line].index(current_station)) && i < (lines[current_line].index("Union Square"))
          # print out the stations along the way
          puts "You will pass " + v
        end
      end
    end



  # else if we're going backwards...
  else

    lines[current_line].each_with_index do |v, i|

      # if the station is between the interchange and the start point
      if i < (lines[current_line].index(current_station)) && i > (lines[current_line].index("Union Square"))
        reverse_array << v
      end

    end

    reverse_array.reverse!


    reverse_array.each do |v|
        puts "You will pass " + v
    end

  end


  #### interchange ############

  puts "Then change at Union Square"


  ####### second leg forwards and backwards ############

  # if we're going forwards...
  if (lines[destination_line].index("Union Square")) < (lines[destination_line].index(destination_station))

    lines[destination_line].each_with_index do |v, i|

      if i > (lines[destination_line].index("Union Square")) && i < (lines[destination_line].index(destination_station))

        puts "You will pass " + v

      end

    end

  # else if we're going backwards...
  else

    lines[destination_line].each_with_index do |v, i|

      # if the station is between the interchange and the end point
      if i < (lines[destination_line].index("Union Square")) && i > (lines[destination_line].index(destination_station))
        reverse_array2 << v
      end

    end

    reverse_array2.reverse!


    reverse_array2.each do |v|
        puts "You will pass " + v
    end

  end





  puts "ending at #{destination_station}"


end

# variables need to be tidied up
# is the second reverse array necessary (probably, in the event of going backwards on leg 1 and backwards again on leg 2)
# tidy up spacing
# make this shit as DRY as possible
# adapt into current mta2 lab for sinatra

