# $ gem install rainbow
# require 'rainbow'

def read_choice
	puts "Welcome to Crappy Calc"
	puts "Available functions"
	puts "1. for addtion"
	puts "2. for subtraction"
	puts "3. for mulitplication"
	puts "4. for division"
	puts "5. for exponent"
	puts "6. to square root"
	puts "Q. Quit"

print "Please enter you selection: "
	choice = gets.chomp.downcase
	choice
end

def add
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i
	puts "Answer = #{(x + y)}"
end

def subtract
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i
	puts "Answer = #{(x - y)}"
end

def multiply
	print "Enter the first number: "
	x = gets.to_i
	print "Enter the second number: "
	y = gets.to_i
	puts "Answer = #{(x * y)}"
end

def divide
	print "Enter the first number: "
	x = gets.to_f
	print "Enter the second number: "
	y = gets.to_f
	puts "Answer = #{(x / y)}"
end
def exponent
	print "Enter the number to times by: "
	x = gets.to_f
	print "Enter the exponent number: "
	y = gets.to_f
	puts "Answer = #{(x ** y)}"
end

def square_root
	print "Enter the number to sq root: "
	x = gets.to_f
	puts "Answer = #{(x)}", Math.sqrt(x)
end
menu_selection = read_choice
while menu_selection != 'q'
	case menu_selection
	when '1'
		add
	when '2'
		subtract
	when '3'
		multiply
	when '4'
		divide
	when '5'
		exponent
	when '6'
		square_root
			
	else
		puts "Unknown function"
	end
		
	menu_selection = read_choice
end

puts "Thank you for using Crappy Calc"