
require 'Rainbow'

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
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i

	puts Rainbow("ANS: #{x} + #{y} = #{x + y}").red
end

menu_selection = read_location