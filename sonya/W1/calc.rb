# 1. A user should be given a menu of operations
# 2. A user should be able to choose from the menu
# 3. A user should be able to enter numbers to perform the operation on
# 4. A user should be shown the result
# 5. This process should continue until the user selects a quit option from the menu

# $ gem install rainbow
require 'rainbow'

# Create menu arithmetic (+,-, *, /)

def read_choice
	print Rainbow("\n\n\t***Calculator dressed as lamb***\n").red
	puts "1. Addition"
	puts "2. Subtract"
	puts "3. Multiple"
	puts "4. Divide"
	puts "5. Square"
	puts "6. Square Root"
	puts "Q. Quit"
	print Rainbow("\n\Please enter your selection: \n\n").blue

	choice = gets.chomp.downcase
	choice
end

def add
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i

	puts Rainbow("ANS: #{x} + #{y} = #{x + y}").red
end

def subtract
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i

	puts Rainbow("ANS: #{x} - #{y} = #{x - y}").red
end

def multiple
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i

	puts Rainbow("ANS: #{x} * #{y} = #{x * y}").red
end

def divide
	print "Enter the first number: "
	x = gets.to_i.to_f
	print "Enter the second number: "
	y = gets.to_i.to_f

	puts Rainbow("ANS: #{x} / #{y} = #{x / y}").red
end

def square
	print "Enter a number: "
	x = gets.to_i.to_f

	puts Rainbow("ANS: #{x} * #{x} = #{x * x}").red
end

def square_root
	print "Enter a number: "
	x = gets.to_i.to_f

	puts "The Square Root of #{x} is: ", Math.sqrt(x)
end

menu_selection = read_choice

while menu_selection != 'q'
	case menu_selection
	when '1'
		add
	when '2'
		subtract
	when '3'
		multiple
	when '4'
		divide
	when '5'
		square
	when '6'
		square_root
	else 
		puts "Unknown function"
	end
	
	menu_selection = read_choice
end

puts Rainbow("\n\n\t***Thank you for using Calculator dressed as lamb***\n").red