#creates a subway_lines hash

subway_lines = {

	"N" => ["Times Square", "34th", "28th(N)", "23rd(N)", "Union Square", "8th(N)"],
	"L" => ["8th(L)", "6th", "Union Square", "3rd", "1st"],
	"6" => ["Grand Central", "33rd", "28th(6)", "23rd(6)", "Union Square", "Astor Place"]
}

#gets user inputs and stores them in variables

puts "Which line are you getting on at? "
puts subway_lines.keys
print '> '
line_on = gets.chomp.upcase

puts "Which stop are you getting on at?"
if line_on == "N"
	puts subway_lines["N"]
elsif line_on == "L"
	puts subway_lines["L"]
elsif line_on == "6"
	puts subway_lines["6"]
else
	puts "No such line!"
end
print '> '
stop_on = gets.chomp

puts "Which line are you getting off at?"
puts subway_lines.keys
print '> '
line_off = gets.chomp.upcase

puts "Which stop are you getting off at?"
if line_off == "N"
	puts subway_lines["N"]
elsif line_off == "L"
	puts subway_lines["L"]
elsif line_off == "6"
	puts subway_lines["6"]
else
	puts "No such line!"
end
print '> '
stop_off = gets.chomp

#executes code depending on whether the traveller is staying on the same line

if line_on == line_off && subway_lines[line_on].index(stop_on) < subway_lines[line_on].index("Union Square") && subway_lines[line_off].index(stop_off) > subway_lines[line_off].index("Union Square")

	index_1 = subway_lines[line_on].index(stop_on)
	index_2 = subway_lines[line_off].index(stop_off)

	stations = subway_lines[line_on][index_1..index_2]
	stations.shift
	total_stops = stations.length
	puts "Your destination is #{total_stops} stops away."

elsif line_on == line_off && subway_lines[line_on].index(stop_on) > subway_lines[line_on].index("Union Square") && subway_lines[line_off].index(stop_off) < subway_lines[line_off].index("Union Square")

	index_1 = subway_lines[line_off].index(stop_off) 
	index_2 = subway_lines[line_on].index(stop_on)

	stations = subway_lines[line_on][index_1..index_2]
	stations.shift
	total_stops = stations.length
	puts "Your destination is #{total_stops} stops away."

#executes code depending on whether the traveller is changing lines, and:
#whether they get on at a stop before union square and get get off at a stop after it on another line

elsif line_on != line_off && subway_lines[line_on].index(stop_on) < subway_lines[line_on].index("Union Square") && subway_lines[line_off].index(stop_off) > subway_lines[line_off].index("Union Square")

	index_1 = subway_lines[line_on].index(stop_on)
	index_2 = subway_lines[line_on].index("Union Square")
	index_3 = subway_lines[line_off].index("Union Square")
	index_4 = subway_lines[line_off].index(stop_off)

	stops_on_first_line = subway_lines[line_on][index_1..index_2]
	stops_on_first_line.shift
	stops_on_second_line = subway_lines[line_off][index_3..index_4]
	stops_on_second_line.shift
	total_stops = stops_on_first_line.length + stops_on_second_line.length
	puts "Your destination is #{total_stops} stops away. You'll need to change lines at Union Square."

#whether they get on at a stop before union square and get get off at a stop before it on another line

elsif line_on != line_off && subway_lines[line_on].index(stop_on) < subway_lines[line_on].index("Union Square") && subway_lines[line_off].index(stop_off) < subway_lines[line_off].index("Union Square")

	index_1 = subway_lines[line_on].index(stop_on) 
	index_2 = subway_lines[line_on].index("Union Square")
	index_3 = subway_lines[line_off].index(stop_off) 
	index_4 = subway_lines[line_off].index("Union Square")

	stops_on_first_line = subway_lines[line_on][index_1..index_2]
	stops_on_first_line.shift
	stops_on_second_line = subway_lines[line_off][index_3..index_4]
	stops_on_second_line.shift
	total_stops = stops_on_first_line.length + stops_on_second_line.length
	puts "Your destination is #{total_stops} stops away. You'll need to change lines at Union Square."
	
#whether they get on at a stop after union square and get get off at a stop before it on another line

elsif line_on != line_off && subway_lines[line_on].index(stop_on) > subway_lines[line_on].index("Union Square") && subway_lines[line_off].index(stop_off) < subway_lines[line_off].index("Union Square")

	index_1 = subway_lines[line_on].index("Union Square") 
	index_2 = subway_lines[line_on].index(stop_on)
	index_3 = subway_lines[line_off].index(stop_off) 
	index_4 = subway_lines[line_off].index("Union Square")

	stops_on_first_line = subway_lines[line_on][index_1..index_2]
	stops_on_first_line.shift
	stops_on_second_line = subway_lines[line_off][index_3..index_4]
	stops_on_second_line.shift
	total_stops = stops_on_first_line.length + stops_on_second_line.length
	puts "Your destination is #{total_stops} stops away. You'll need to change lines at Union Square."

#whether they get on at a stop after union square and get get off at a stop after it on another line

elsif line_on != line_off && subway_lines[line_on].index(stop_on) > subway_lines[line_on].index("Union Square") && subway_lines[line_off].index(stop_off) > subway_lines[line_off].index("Union Square")

	index_1 = subway_lines[line_on].index("Union Square") 
	index_2 = subway_lines[line_on].index(stop_on)
	index_3 = subway_lines[line_off].index("Union Square")
	index_4 = subway_lines[line_off].index(stop_off)

	stops_on_first_line = subway_lines[line_on][index_1..index_2]
	stops_on_first_line.shift
	stops_on_second_line = subway_lines[line_off][index_3..index_4]
	stops_on_second_line.shift
	total_stops = stops_on_first_line.length + stops_on_second_line.length
	puts "Your destination is #{total_stops} stops away. You'll need to change lines at Union Square."

elsif stop_on == stop_off
	puts "You're already there!"
end

# Activity:

# Students should create a program that models a simple subway system.

# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.

# All 3 subway lines intersect at Union Square, but there are no other intersection points.
# For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.
# Hints:

# Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
# Make subway lines are keys in a hash, while the values are an array of all the stops on each line.
# The key to the lab is to find the intersection of the lines at Union Square.
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)




