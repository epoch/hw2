require 'rainbow'

# Students should create a program that models a simple subway system.

# http://www.ruby-doc.org/core-2.2.0/Array.html#method-i-index

# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

# ask user which line, which stop SEE: read_alight.rb

# STEP 1: Make the subway_line a hash
# STEP 2: Make each trainline a key in the hash i.e subway_line.key = n_line, l_line, 6_line
	# STEP 2.1: Make each key have a value of the stops on that trainline ie. subway_line.n_line = Times


subway = { 
	n_line: ["times square", "34th on N", "28th on N", "23rd on N", "union square", "8th on N"], 
	six_line: ["grand central", "33rd on 6", "28th on 6", "23rd on 6", "union square", "astor place"], 
	l_line: ["8th on L", "6th on L", "union square", "3rd on L", "1st on L"] 
} 

print Rainbow("Where are you now?: \n").red
user_location = "times square"

puts user_location

puts Rainbow("Which line are you starting from: ").red
starting_line = :n_line

puts starting_line

puts Rainbow("What station are you going to?: ").green
destination = "astor place"

puts destination

puts Rainbow("What line is that station on?: ").green
destination_line = :six_line

puts destination_line

# I want to count the absolute value in the array from times square to Union Sqaure.
# I want to add this count to the absolute value from astor place to Union Square
# I want to add these two values together

def count_stops(user_location, starting_line, destination, destination_line, subway) 

	if starting_line == destination_line 
		number_of_stops = subway[destination_line].index(destination) - subway[starting_line].index(user_location) 
	else
		to_union = subway[starting_line].index("union square") - subway[starting_line].index(user_location) 
		from_union = subway[destination_line].index(destination) - subway[destination_line].index("union square") 
		number_of_stops = to_union.abs + from_union.abs 
	end
end

puts Rainbow("Your total number of stops are: ").blue
p count_stops(user_location, starting_line, destination, destination_line, subway) 



