# #Calculator

# ###Explanation
# - You will be building a calculator.  A calculator can perform multiple arithmetic operations.  Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.

# ###Specification:
# - A user should be given a menu of operations
# - A user should be able to choose from the menu
# - A user should be able to enter numbers to perform the operation on
# - A user should be shown the result
# - This process should continue until the user selects a quit option from the menu

# #####Phase 1
# - Calculator functionality
# 	- Calculator should be able to do basic arithmetic (+,-, *, /)

# #####Phase 2
# - Advanced Calculator functionality
# 	- Calculator should be able to do basic arithmetic (exponents, square roots)

# #####Phase 3
# - User should be given a menu of Calculator functionality
# - User should be able to choose intended functionality

def read_choice
	puts "Welcome to Crappy Calc"
	puts "Available functions:"
	puts "1. Addition"
	puts "2. Subtraction"
	puts "3. Multiplication"
	puts "4. Division"
	puts "5. Exponents"
	puts "6. Square Root"
	puts "Q: Quit"

	print "Please enter your selection: "

	choice = gets.chomp.downcase
	choice
end

def add(x, y)
	x + y
end
	
def subtract(x, y)
	x - y
end

def multiply(x, y)
	x * y
end

def divide(x, y)
	x / y
end

def exponent(x, y)
	x % y
end

def square_root(x, y)
	x ** y
end

menu_selection = read_choice

while menu_selection != 'q'
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i
	case menu_selection
	when '1'
		print "#{x} + #{y} = "
		puts add(x, y)
	when '2'
		print "#{x} - #{y} = "
		puts subtract(x, y)
	when '3'
		print "#{x} * #{y} = "
		puts multiply(x, y)
	when '4'
		print "#{x} / #{y} = "
		puts divide(x, y)
	when '5'
		print "#{x} % #{y} = "
		puts exponent(x, y)
	when '6'
		print "#{x} ** #{y} = "
		puts square_root(x, y)
	else
		puts "Unknown function"
	end
	menu_selection = read_choice
end

puts "Thank you for using Crappy Calc!"
