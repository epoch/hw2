# Leap year

def leap_year
	puts "Enter a year and I'll tell ya if it's a leap year!"
	input = gets.to_i

	if input % 4 == 0
		puts "This is a leap year."

	elsif input % 100 == 0
		puts "This is not a leap year."

	elsif input % 400 == 0
		puts "This is not a leap year."
		
	else
		puts "This is not a leap year."	
	end
	leap_year
end

leap_year

