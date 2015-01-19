# $ gem install rainbow
# require 'rainbow'

def read_choice
	puts " ----------------------"
	puts "|  Availble functions: |"
	puts " ----------------------"
	puts "|  a. Addition         |"
	puts "|  s. Subtraction      |"
	puts "|  d. Division         |"
	puts "|  m. Multiplication   |"
	puts "|  e. Exponentiation   |"
	puts "|  r. Square Root      |"
	puts "| sq. Square           |"
	puts "|  c. Cube             |"
	puts "|  p. Percentage       |"
	puts "|  q. Quit             |"
	puts " ----------------------"

	choice = gets.chomp.downcase
end

# needs to take multiple numbers
def add(x, y)
  puts "#{x + y}"
end

# needs to take multiple numbers
def subtract(x, y)
  puts "#{x - y}"
end

# needs to take multiple numbers
def divide(x, y)
	puts "#{x / y}"
end

# needs to take multiple numbers
def multiply(x, y)
	puts "#{x * y}"
end

def expontentiate(x, y)
	puts "#{x ** y}"
end

def exp
	print "Please enter a number: "
	number = gets.to_f
end

def power
	print "Please enter a power: "
	power = gets.to_f
end

def root(x)
	puts "#{Math.sqrt(x)}"
end

def square(x)
	puts "#{x * x}"
end

def cube(x)
	puts "#{x ** 3}"
end

def percent
	print "Please enter a number: "
	number = gets.to_f
	print "Please enter a total: "
	total = gets.to_f
	puts "#{((number / total) * 100)}%"
end

def get_number
	print "Please input the first number: "
	number_1 = gets.to_f
end

def get_number2
	print "Please input the second number: "
	number_2 = gets.to_f
end

puts '     /\  \         /\  \         /\__\     /\  \    '
puts '    /::\  \       /::\  \       /:/  /    /::\  \   '
puts '   /:/\:\  \     /:/\:\  \     /:/  /    /:/\:\  \  '
puts '  /:/  \:\  \   /::\~\:\  \   /:/  /    /:/  \:\  \ '
puts ' /:/__/ \:\__\ /:/\:\ \:\__\ /:/__/    /:/__/ \:\__\ '
puts ' \:\  \  \/__/ \/__\:\/:/  / \:\  \    \:\  \  \/__/'
puts '  \:\  \            \::/  /   \:\  \    \:\  \      '
puts '   \:\  \           /:/  /     \:\  \    \:\  \     '
puts '    \:\__\         /:/  /       \:\__\    \:\__\    '
puts '     \/__/         \/__/         \/__/     \/__/    '
puts '      ___           ___           ___                       ___     '
puts '     /\  \         /\  \         /\  \          ___        /\__\    '
puts '     \:\  \       /::\  \       /::\  \        /\  \      /::|  |   '
puts '      \:\  \     /:/\:\  \     /:/\:\  \       \:\  \    /:|:|  |   '
puts '      /::\  \   /::\~\:\  \   /::\~\:\  \      /::\__\  /:/|:|  |__ '
puts '     /:/\:\__\ /:/\:\ \:\__\ /:/\:\ \:\__\  __/:/\/__/ /:/ |:| /\__\ '
puts '    /:/  \/__/ \/_|::\/:/  / \/__\:\/:/  / /\/:/  /    \/__|:|/:/  / '
puts '   /:/  /         |:|::/  /       \::/  /  \::/__/         |:/:/  / '
puts '   \/__/          |:|\/__/        /:/  /    \:\__\         |::/  /  '
puts '                  |:|  |         /:/  /      \/__/         /:/  /   '
puts '                   \|__|         \/__/                     \/__/        v1.0'
puts "\n"
puts "Welcome to Calc Train!"
puts "\n"

use_counter = 0

menu_selection = read_choice

while menu_selection != 'q'
	
	# ------------------------------------
	# loop keeps prompting user for a valid option, will not progress until it gets one
	# needs a functioning way of checking if the input is one a series of options without looking so disgusting 
	until menu_selection == 'a' || menu_selection == 's' || menu_selection == 'd' || menu_selection == 'm' || menu_selection == 'e' || menu_selection == 'r' || menu_selection == 'sq' || menu_selection == 'c' || menu_selection == 'p'
	# ------------------------------------

	# CAN BE FIXED USING SOME SORT OF ARRAY.INCLUDE? THING
	# until menu_selection.include? 'a', 's', 'd', 'm', 'e', 'r', 'sq', 'c', 'p'
		puts "Unknown function. Please choose again:"
		menu_selection = read_choice
	end

	case menu_selection
		when 'a' then add(get_number, get_number2)
		when 's' then subtract(get_number, get_number2)
		when 'd' then divide(get_number, get_number2)
		when 'm' then multiply(get_number, get_number2)
		when 'e' then expontentiate(exp, power)
		when 'r' then root(get_number)
		when 'sq' then square(get_number)
		when 'c' then cube(get_number)
		when 'p' then percent 
		else
			# currently gives you a second chance but is meaningless; first input NEEDS to be the right answer
			puts "Unknown function. Please choose again:"
			menu_selection = read_choice
	end
	
	puts "\n"
	print "Do you want to ride the Calc Train again? (y/n) "	
	again = gets.chomp.downcase

	until again == 'y' || again == 'n'
		print "Please press y or n: "
		again = gets.chomp.downcase
	end

	if again == 'n'
		menu_selection = 'q'
	else
		menu_selection = read_choice
	end

	# remind user they are a cheapskate
	use_counter += 1
	if use_counter % 3 == 0
	  puts "\n"
		puts "Are you ever going to purchase Calc Train?"
	  puts "\n"
	end
end

puts "Thank you for using Calc Train."

# multiple numbers?
# functions I wrote on RubyMonk
# def add(*numbers)
#   numbers.inject {|sum, number| sum + number}
# end

# def subtract(*numbers)
#   numbers.inject {|sum, number| sum - number}
# end