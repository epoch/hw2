require 'rainbow'

# Students should create a program that models a simple subway system.

subway = { 
	n_line: ["times square", "34th on N", "28th on N", "23rd on N", "union square", "8th on N"], 
	six_line: ["grand central", "33rd on 6", "28th on 6", "23rd on 6", "union square", "astor place"], 
	l_line: ["8th on L", "6th on L", "union square", "3rd on L", "1st on L"] 
} 

# print Rainbow("Where are you now?: \n").red
# user_location = "times square"
# puts user_location

# puts Rainbow("Which line are you starting from: ").red
# starting_line = :n_line
# puts starting_line

# puts Rainbow("What station are you going to?: ").green
# destination = "astor place"
# puts destination

# puts Rainbow("What line is that station on?: ").green
# destination_line = :six_line
# puts destination_line

def read_location
	print Rainbow("\n\n\t***Select your Train Line***\n").red	
	puts "(N) Line"
	puts "(L) Line"
	puts "(S) Six Line"
	print Rainbow("\n\Please enter your selection: \n\n").blue

	location = gets.chomp.downcase
	location
end

def n_line
	print "Where are you now?: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i

	puts Rainbow("ANS: #{x} + #{y} = #{x + y}").red
end

menu_selection = read_location

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



