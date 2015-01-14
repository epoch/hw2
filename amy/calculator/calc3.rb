while @choice != "q" 
	puts "Welcome to Crappy Calc"
	puts "Available functions:"
	puts "1. Addition"
	puts "2. Subtraction"
	puts "3. Multiply"
	puts "4. Divide"
	puts "5. Square root"
	puts "6. Exponent"
	puts "Q. Quit"
	print "Please enter your selection: "
	@choice = gets.chomp.downcase

	case @choice
		when "1"
			print "Enter the first number: "
			x = gets.to_i
			print "Enter the number you want to add: "
			y = gets.to_i
			result = x + y
			puts "#{x} + #{y} = #{result}"
		when "2"
			print "Enter the first number: "
			x = gets.to_i
			print "Enter the number you want to subtract: "
			y = gets.to_i
			result = x - y
			puts "#{x} - #{y} = #{result}"
		when "3"
			print "Enter the first number: "
			x = gets.to_i
			print "Enter the number you want to multiply by: "
			y = gets.to_i
			result = x * y
			puts "#{x} * #{y} = #{result}"
		when "4"
			print "Enter the first number: "
			x = gets.to_i
			print "Enter the number you want to divide by: "
			y = gets.to_i
			unless x % y > 0
				result = x / y
			else
				result = x.to_f / y.to_f
			end
			puts "#{x} / #{y} = #{result}"
		when "5"
			print "Enter the number you would like the square root of: "
			x = gets.to_i
			result = Math.sqrt(x)
			puts "The square root of #{x} = #{result}"
		when "6"
			print "Enter the base number: "
			x = gets.to_i
			print "To the power of: "
			y = gets.to_i
			result = x ** y
			puts "#{x} ^ #{y} = #{result}"
		when "q"
			puts "Thanks for using Crappy Calc!"
		else
			puts "That's not a valid function. Please make another choice."
	end
end