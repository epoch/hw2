# Air Conditioning

# Ask the user what the current temperature is, if the A/C is functional, and what temperature they wish it was.
# If the airconditioner is functional and the current temperature is above the the desired temperature... display "Turn on the A/C Please"
# If the airconditioner is non-functional and the current temperature is above the the desired temperature... display "Fix the A/C now! It's hot!"
# If the airconditioner is non-functional and the current temperature is below the the desired temperature... display "Fix the A/C whenever you have the chance... It's cool..."


# if ( ac == "yes") && (current > wish)
# 	puts "Turn on the A/C please."
# elsif (ac == "no") && (current > wish)
# 	puts "Fix the A/C now! It's hot!"
# elsif (ac == "no") && (current < wish)
# 	puts "Fix the A/C whenever you have the chance...It's cool..."
# else
# 	puts "Enjoy the weather!"
# end 

# ^^^^ old way 

# print "What is the current temperature? "
# current = gets.chomp.to_i

# print "Is the A/C working? (yes/no) "
# ac = gets.chomp.downcase

# print "What temperature do you wish it was? "
# wish = gets.chomp.to_i

# ^^^^ the way without defining acmessage as a method/function 

def acmessage(current, ac, wish)
	if ( ac == "yes")
		if (current > wish)
			puts "Turn on the A/C please."
		end
	else 
		if (current > wish)
		puts "Fix the A/C now! It's hot!"
		else 
			puts "Fix the A/C whenever you have the chance...It's cool..."
		end
	end
end


acmessage(69,"no", 75)
acmessage(75,"no", 69)
acmessage(69,"yes", 75)
acmessage(75,"yes", 69)



