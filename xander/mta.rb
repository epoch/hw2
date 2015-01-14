require 'pry'

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




# hash of lines with arrays of the stations on each line

lines = {	"LineN" => ["8", "Union_Square", "23", "28", "34", "Times_Square"], 
			"LineL" => ["1", "3", "Union_Square", "6", "8"],
			"Line6" => ["Astor_Place", "Union_Square", "23", "28", "33", "Grand_Central"]
		}

# determine on which line the user is currently located
def starting_line
	print "Which line are you on?: "
	current_line = gets.chomp
end

# determine at which station the user is currently located
def starting_station
	print "Which station are you at?: "
	current_station = gets.chomp
end

# determine the destination line of the user 
def destination_line
	print "What is your destination line?: "
	destination_line = gets.chomp
end

# determine the destination station of the user
def destination_station
	print "What is your destination station?: "
	destination_station = gets.chomp
end










binding.pry


# construct method asking user for input
	# current_line {1. LineN, 2. LineL, 3. Line6}
	# current_station {show array of stations within each line}
	# destination_line {1. LineN, 2. LineL, 3. Line6}
	# destination_station {show array of stations within each line}










