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

# gets info for the line the user is getting on at 

puts "What line are you getting on at? (N, L, or 6)"
line_start = gets.chomp.upcase

if line_start == "N"
	puts "What stop are you getting on at? (Times Square, 34th, 28th, 23rd, Union Square, or 8th)"
	stop_start = gets.chomp.upcase
elsif line_start == "L"
	puts "What stop are you getting on at? (8th, 6th, Union Square, 3rd, or 1st)" 
	stop_start = gets.chomp.upcase
elsif line_start == "6"
	puts "What stop are you getting on at? (Grand Central, 33rd, 28th, 23rd, Union Square, or Astor Place)" 
	stop_start = gets.chomp.upcase
end 

# gets info for the line the user is getting off at 

puts "What line are you getting off at? (N, L, or 6)" 
line_end = gets.chomp.upcase

if line_end == "N"
	puts "What stop are you getting on at? (Times Square, 34th, 28th, 23rd, Union Square, or 8th)"
	stop_end = gets.chomp.upcase
elsif line_end == "L"
	puts "What stop are you getting on at? (8th, 6th, Union Square, 3rd, or 1st)" 
	stop_end = gets.chomp.upcase
elsif line_end == "6"
	puts "What stop are you getting on at? (Grand Central, 33rd, 28th, 23rd, Union Square, or Astor Place)" 
	stop_end = gets.chomp.upcase
end 

# the array 

subway = { 
	"N" => ["TIMES SQUARE", "34TH", "28TH", "23RD", "UNION SQUARE", "8TH"], 
	"L" => ["8TH", "6TH", "UNION SQUARE", "3RD", "1ST"],
	"6" => ["GRAND CENTRAL", "33RD", "28TH", "23RD", "UNION SQUARE", "ASTOR PLACE"],
	}

# the functions 


if line_start == line_end
	puts "#{stop_end} is #{(subway[line_start].index(stop_start).to_i - subway[line_end].index(stop_end).to_i).abs} stops away on Line #{line_end}. Have a nice day!" 
else 
	puts "#{stop_end} is #{(subway[line_start].index("Union Square").to_i - subway[line_start].index(stop_start).to_i).abs + (subway[line_end].index("Union Square").to_i - subway[line_end].index(stop_end).to_i).abs} stops away on Line #{line_end} and you will have to transfer at Union Square. Have a nice day!"
end


