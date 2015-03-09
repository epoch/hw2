# Calculator
# Explanation

# You will be building a calculator. A calculator can perform multiple arithmetic operations. Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
# Specification:

# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# This process should continue until the user selects a quit option from the menu

# Phase 1
# Calculator functionality
# Calculator should be able to do basic arithmetic (+,-, *, /)

# Phase 2
# Advanced Calculator functionality
# Calculator should be able to do basic arithmetic (exponents, square roots)

# Phase 3
# User should be given a menu of Calculator functionality
# User should be able to choose intended functionality

# $ gem install rainbow
# require 'rainbow'









# unless x % y > 0
# 				result = x / y
# 			else
# 				result = x.to_f / y.to_f
# 			end

			
require 'rainbow'
		print Rainbow("\n\n\t**** My Wonderful Calculator\n").red 

def read_choice
 puts "Welcome to Crappy Calc"
 puts "Available functions:"
 puts "1. Addition" 
 puts "2. Subtraction" 
 puts "3. Multiplication" 
 puts "4. Division" 
 puts "5. Exponents" 
 puts "6. Square Root" 
 puts "Q. Quit"
 

 print "Please enter your selection: "

 choice = gets.chomp.downcase 
 choice 
end 


def numbers
	print "Enter a number: "
	x = gets.to_f 
end 


# operations 
def add
	puts numbers + numbers 
end 

def subtract  
	puts numbers - numbers 
end 

def multiply  
	puts numbers * numbers 
end 

def divide  
	puts numbers / numbers 
end 

def exponents 
	puts numbers ** numbers 
end 

def root 
	puts numbers ** (1/numbers)
end 

menu_selection = read_choice

while menu_selection != "q"
	case menu_selection
	when "1"
		add
	when "2"
		subtract
	when "3"
		multiply
	when "4"
		divide 
	when "5"
		exponents
	when "6"
		root  
	else
		puts "Unknown function"
	end 
	menu_selection = read_choice
end 

puts "Thank you for using Crappy Calc"
























