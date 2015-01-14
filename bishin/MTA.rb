
# Library

# Line_N = ["time_square_N", "34th_N", "28th_N", "23rd_N", "union_square", "8th_N"]
# Line_L = ["8th_L", "6th_L","union_square", "3rd_L","1st_L"]
# Line_6 = ["grand_central_6", "33rd_6", "28th_6", "23rd_6", "union_square", "astor_place_6"]

MTA = { :Line_N => ["time_square_N", "34th_N", "28th_N", "23rd_N", "union_square", "8th_N"], 
		:Line_L => ["8th_L", "6th_L","union_square", "3rd_L","1st_L"], 
		:Line_6 => ["grand_central_6", "33rd_6", "28th_6", "23rd_6", "union_square", "astor_place_6"]
		}

# Choose start line
puts "Choose your starting line:"
puts "Line_N"
puts "Line_L"
puts "Line_6"

puts ""
start_line = gets.chomp
puts "You are starting on #{start_line}"
puts ""

# Choose start station
if start_line == "Line_N"
	puts "Select your starting station: "
	puts MTA[:Line_N]
elsif start_line =="Line_L"
	puts "Select your starting station: "
	puts MTA[:Line_L]
elsif start_line == "Line_6"
	puts "Select your starting station: "
	puts MTA[:Line_6]
end

puts ""
start_station = gets.chomp
puts "You are starting at #{start_station}"
puts ""

# Choose end line
puts "Choose your ending line:"
puts "Line_N"
puts "Line_L"
puts "Line_6"

puts ""
end_line = gets.chomp
puts "You are ending your journey on #{end_line}"
puts ""

# Choose end station
if end_line == "Line_N"
	puts "Select your ending station: "
	puts MTA[:Line_N]
elsif end_line =="Line_L"
	puts "Select your ending station: "
	puts MTA[:Line_L]
elsif end_line == "Line_6"
	puts "Select your ending station: "
	puts MTA[:Line_6]
end

puts ""
end_station = gets.chomp
puts "You are ending your journey at #{end_station}"
puts ""

# Calculate number of stations

Journey_1 = MTA[start_line.to_sym].index(start_station) - MTA[start_line.to_sym].index("union_square")

Journey_2 = MTA[end_line.to_sym].index(end_station)-MTA[end_line.to_sym].index("union_square")

Total_stops = Journey_1.abs + Journey_2.abs

puts ""
puts " When travelling from #{start_station} on #{start_line} to #{end_station} on #{end_line} you will reach your destination in #{Total_stops} stops"


# Total_stops = Line_L.index("union_square") - Line_L.index("8th_L")+ -(Line_6.index("23rd_6")-Line_6.index("union_square"))
# puts Total_stops

# Which line are you starting on?
# Which line do you want to end on?
# If start line = end line
	# return Line_X[stop .. start].count
# Else find start line, find end line
	# return Line_start[union_square..start].count + Line_end[stop..union_square]

