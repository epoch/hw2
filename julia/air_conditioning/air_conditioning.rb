# Ask the user what the current temperature is, if the A/C is functional, and what temperature they wish it was.
# - If the airconditioner is functional and the current temperature is above the the desired temperature... display "Turn on the A/C Please"
# - If the airconditioner is non-functional and the current temperature is above the the desired temperature... display "Fix the A/C now! It's hot!"
# - If the airconditioner is non-functional and the current temperature is below the the desired temperature... display "Fix the A/C whenever you have the chance... It's cool..."

print "What is the temperature? "
temperature = gets.to_i

print "Is the A/C working (y or n)? "
working = gets.chomp.downcase

print "What is your desired temperature? "
desired_temperature = gets.to_i

def air_con(current_temp, function, desired_temp)
	if function == "y"
		if current_temp > desired_temp
			puts "Turn on the AC"
		end
	else
		if current_temp > desired_temp
			puts "Fix the A/C now! It's hot!"
		else
			"Fix the A/C whenever you have the chance... It's cool..."
		end
	end
end

air_con(temperature, working, desired_temperature)


# if ac_function == 'yes' && temperature > desired_temperature
# 	puts "Turn on the A/C Please"
# elsif ac_function == 'no' && temperature > desired_temperature
# 	puts "Fix the A/C now! It's hot!"
# elsif ac_function == 'no' && temperature < desired_temperature
# 	puts "Fix the A/C whenever you have the chance... It's cool..."
# else
# 	puts "AC is working! Put the heat on! It's cold.."
# end