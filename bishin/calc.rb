#gem install rainbow
#require 'rainbow'

# Welcome
def read_choice
	puts "Available functions: "
	puts "1. Addition"
	puts "2. Subtraction"
	puts "3. Multiplication"
	puts "4. Division"
	puts "5. Exponential"
	puts "6. Square Root"
	puts "Q. Quit"

	print "Please enter your selection: "
	choice = gets.chomp.downcase
	choice
end

# Operations
def Addition(x, y)
	puts "#{ x } + #{ y } = #{ x + y }"
end

def Subtraction(x, y)
	puts "#{ x } - #{ y } = #{ x - y }"
end

def Multiplication(x, y)
	puts "#{ x } * #{ y } = #{ x * y }"
end

def Division(x, y)
	puts "#{ x } / #{ y } = #{ x / y }"
end

def Exponential(x, y)
	puts "#{ x } ** #{ y } = #{ x ** y }"
end

def Square_root(x)
	puts "The square root of #{x} is #{ Math.sqrt(x)}"
end

#Program
puts "Welcome to Crappy Calc"

menu_selection = read_choice

if menu_selection.to_i > 6 && menu_selection!= 'q' # does not tell if you don't pick a valid option
	puts "Error! This is not an option"
	read_choice
else

	while menu_selection!= 'q' || continue!= 'n'

		if  menu_selection.to_i == 6
			print "Enter the number you wish to find the square root of: " # This repeats when you choose n afer running the program
			x = gets.to_f
		else
			print "Enter the first number: "# This repeats when you choose n afer running the program
			x = gets.to_f

			print "Enter the second number: "# This repeats when you choose n afer running the program		
			y = gets.to_f
		end

		case menu_selection
		when '1'
			Addition(x, y)
		when '2' 
			Subtraction(x, y)
		when '3'
			Multiplication(x, y)
		when '4'
			Division(x, y)
		when '5'
			Exponential(x,y)
		when '6'
			Square_root(x)
		else
		puts "Unknown function"
		end

		puts "Do you want to continue using the calculator? (y/n) "
		continue = gets.chomp.downcase

		if continue == "y"
			menu_selection = read_choice
		else
			puts "Thank you for using Crappy Calc"
		end
	end
end

puts "Thank you for using Crappy Calc"

#sqrt(x)

