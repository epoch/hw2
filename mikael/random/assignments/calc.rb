# Calculator

def read_choice
	puts
	puts "** Calculator **"
	puts "Available functions:"
	puts "1. Add"
	puts "2. Subtract"
	puts "3. Multiply"
	puts "4. Divide"
	puts "5. Square"
	puts "6. Cube"
	puts "7. BMI"
	puts "Q. Quit"
	print "Please enter your selection: "
	choice = gets.chomp.downcase
	choice
end

def add
	print "Enter the first number: "
	x = gets.to_f
	print "Enter the second number: "
	y = gets.to_f
	z = x + y
	puts "#{x} + #{y} = #{z}"
end

def subtract
	print "Enter the first number: "
	x = gets.to_f
	print "Enter the second number: "
	y = gets.to_f
	z = x - y
	puts "#{x} - #{y} = #{z}"
end

def multiply
	print "Enter the first number: "
	x = gets.to_f
	print "Enter the second number: "
	y = gets.to_f
	z = x * y
	puts "#{x} * #{y} = #{z}"
end

def divide
	print "Enter the first number: "
	x = gets.to_f
	print "Enter the second number: "
	y = gets.to_f
	z = x / y
	puts "#{x} / #{y} = #{z}"
end

def square
	print "Enter the number: "
	x = gets.to_f
	y = ( x * x )
	puts "The square of #{x} is #{y}"
end

def cube
	print "Enter the number: "
	x = gets.to_f
	y = ( x * x * x )
	puts "The cube of #{x} is #{y}"
end

def bmi
	print "Enter your weight (kg): "
	x = gets.to_f
	print "Enter your height (cm): "
	y = gets.to_f
	z = "%.6f" % (x / (y * y))
	print "Your BMI is #{z}\n"
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
		square
	when '6'
		cube
	when '7'
		bmi
	else
		puts "Is you stupid?"
	end
	menu_selection = read_choice
end

puts
puts "I'd feel better too using pen and paper..."



