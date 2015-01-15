# Base case - is this a leap year?

print "Give me a year: "
year = gets.to_i

def leap_year(y)
	if (y % 4 == 0) || (y % 400 == 0) && (y % 100 != 0)
		puts "This is a leap year!"
	else
		puts "This is not a leap year!"
	end
end

leap_year(year)

