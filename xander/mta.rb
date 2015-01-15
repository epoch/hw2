require 'pry'

lines = {	
	"LINE N" => ["8th", "Union Square", "23rd", "28th", "34th", "Times Square"],
	"LINE L" => ["1st", "3rd", "Union Square", "6th", "8th"],
	"LINE 6" => ["Astor Place", "Union Square", "23rd", "28th", "33rd", "Grand Central"]
}

puts lines.keys
print "Type which line are you on?: "
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

# calculating the number of stops between current and destination station

stops_to_union_square = (lines[current_line].index(current_station) - lines[current_line].find_index("Union Square")).abs
stops_from_union_square = (lines[destination_line].index(destination_station) - lines[destination_line].find_index("Union Square")).abs
number_of_stops = (stops_to_union_square + stops_from_union_square)

# This is the output for the user

puts "Thank you for using Crappy Subway App"
puts "Your travel directions are as follows: "
puts "You are travelling from #{current_station} station on #{current_line} to #{destination_station} station on #{destination_line}."

# this stipulates if the user needs to change lines

if current_line == destination_line
	puts "This route does not require changing trains. Please remain on #{current_line}."
else
	puts "This route requires you to change trains at Union Square to #{destination_line}."
end

puts "The total number of stations you will pass before you arrive at #{destination_station} station on #{destination_line} is #{ (number_of_stops - 1) }."






