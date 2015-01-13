# $ gem install rainbow
require "rainbow"

def read_choice
	puts " S I M P L E   C A L C  ".center(80, ?=)
	puts "Available functions:\n\n"
	puts "\t1. Addition"
	puts "\t2. Subtraction"
	puts "\t3. Multiplication"
	puts "\t4. Division"
	puts "\t5. Exponent"
	puts "\t6. Square Root"
	puts "\tQ. Quit"

	print Rainbow("\nPlease enter your selection:").yellow.inverse + " "

	choice = gets.chomp.downcase
	puts ''.center(80, ?-)
	# Check to see if user has selected a valid option
	if "123456q".split('').include? choice
		choice
	else
		puts Rainbow("Unknown command. Please try again.").red
		sleep 1
		read_choice
	end
end

# Ask user for numbers
def prompt_user_for_numbers
	print "What is your first number? "
	x = gets.to_i
	print "What is your second number? "
	y = gets.to_i
	print Rainbow("Your answer is ").green
	return x, y
end

def square_root
	print "Enter a number: "
	n = gets.to_i
	puts "Your answer is #{Math.sqrt(n)}"
end

menu_selection = nil
while menu_selection != 'q'
	menu_selection = read_choice
	# Option 6 is square root which only requires one input
	unless menu_selection == '6' || menu_selection == 'q'
		x, y = prompt_user_for_numbers
	end
	case menu_selection
	when '1'
		# Addition
		puts x + y
	when '2'
		# Subtraction
		puts x - y
	when '3'
		# Multiply
		puts x * y
	when '4'
		# Division
		puts x / y
	when '5'
		# Exponent
		puts x ** y
	when '6'
		# Square root
		square_root
	else
		# Do nothing
	end
	sleep 1.5
end

puts Rainbow("Thank you for using Simple Calc").blue.bright.underline