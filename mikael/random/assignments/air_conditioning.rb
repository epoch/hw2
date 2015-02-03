###2. Air Conditioning
# - Ask the user what the current temperature is, if the A/C is functional, and what temperature they wish it was.
#     - If the airconditioner is functional and the current temperature is above the the desired temperature... display "Turn on the A/C Please"
#     - If the airconditioner is non-functional and the current temperature is above the the desired temperature... display "Fix the A/C now!  It's hot!"
#     - If the airconditioner is non-functional and the current temperature is below the the desired temperature... display "Fix the A/C whenever you have the chance...  It's cool..."

print "What is the temperature? "
temperature = gets.chomp.to_i

print "Is the A/C functional? (y/n) "
ac_functional = gets.chomp.downcase

print "What is the desired temperature? "
desired_temperature = gets.chomp.to_i


if ac_functional == 'y'
	if temperature > desired_temperature
		puts "Turn on the A/C please"
	end
else
	if temperature > desired_temperature
		puts "Fix the A/C now!  It's hot!"
	else
		puts "Fix the A/C whenever you have the chance...  It's cool..."
	end
end
