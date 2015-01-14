def read_choice
	puts "Welcome to the calculator"
	puts "Available functions:"
	puts "A: Add"
	puts "S: Subtract"
	puts "M: Multiply"
	puts "D: Divide"
	puts "E: Exponent"
	puts "Sq: Square"
	puts "Q: Quit"

	print "Please enter your selection: "

	choice = gets.chomp.downcase
	choice
end

def numbers
	print "Enter a number: "
	x = gets.to_f
end

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
def exponent
	puts numbers ** numbers
end
def square
	puts Math.sqrt(numbers)
end

menu_selection = read_choice

while menu_selection != "q"

	case menu_selection
	when 'a'
		add
	when 's'
		subtract
	when 'm'
		multiply
	when 'd'
		divide
	when 'e'
		exponent
	when 'sq'
		square
	else
		puts "Unknown function"
	end
	
	menu_selection = read_choice
end

puts "Thank you for using the calculator"



# def divide
# 	print "Enter a number: "
# 	x = gets.to_i
# 	print "Enter another number: "
# 	y = gets.to_i
# 	puts "#{x} / #{y} = #{x / y}"
# end
# def exponent
# 	print "Enter a number: "
# 	x = gets.to_i
# 	print "Enter another number: "
# 	y = gets.to_i
# 	puts "#{x} ** #{y} = #{x ** y}"
# end