# checks to see if a given input is a leap year
# i.e.
# - years divisible by 4
# - except multiples of 100
# - with the exception of multiples of 400

def leap?(year)
	# makes sure it doesn't short-circuit and let through every multiple of 4 (as that would include 100s)
	if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
		puts "#{year} is a leap year!"
	else
		puts "#{year} is not a leap year, sorry."
	end
end

leap?(1996)
leap?(1997)
leap?(1900)
leap?(2000)