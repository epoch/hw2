def line_menu
	puts "1. N Line"
	puts "2. L Line"
	puts "3. 6 Line"

	print "Please enter your choice: "
	line_choice = gets.to_i
end

def line_n_station_menu
	puts "1. Times Square"
	puts "2. 34th"
	puts "3. 28th"
	puts "4. 23rd"
	puts "5. Union Square"
	puts "6. 8th"

	print "Please enter your choice: "
	station_choice = gets.to_i
end

def line_l_station_menu
	puts "1. 8th"
	puts "2. 6th"
	puts "3. Union Square"
	puts "4. 3rd"
	puts "5. 1st"

	print "Please enter your choice: "
	station_choice = gets.to_i
end


def line_6_station_menu
	puts "1. Grand Central"
	puts "2. 33rd"
	puts "3. 28th"
	puts "4. 23rd"
	puts "5. Union Square"
	puts "6. Astor Place"

	print "Please enter your choice: "
	station_choice = gets.to_i
end

puts "Welcome to MTA Navigator"

puts "Choose your current line."
current_line = line_menu
case current_line
when 1
	puts "Choose your current station."
	current_station = line_n_station_menu
when 2
	puts "Choose your current station."
	current_station = line_l_station_menu
when 3
	puts "Choose your current station."
	current_station = line_6_station_menu
else
	puts "Unknown line"
end

puts "Choose your destination line."
destination_line = line_menu
case destination_line
when 1
	puts "Choose your destination station."
	destination_station = line_n_station_menu
when 2
	puts "Choose your destination station."
	destination_station = line_l_station_menu
	#current_station
when 3
	puts "Choose your destination station."
	destination_station = line_6_station_menu
else
	puts "Unknown line"
end

# WORK OUT DISTANCE FOR PEOPLE TRAVELLING ON THE SAME LINE

if current_line == destination_line
	if current_station == destination_station
		puts "You're already there."
	elsif current_station > destination_station
		puts "You have a total of #{current_station - destination_station} stops to travel."
	else
		puts "You have a total of #{destination_station - current_station} stops to travel."
	end

# WORK OUT THE FIRST LEG FOR PEOPLE TRAVELING OVER DIFFERENT LINES

else # current_line != destination_line
	if current_line == 1
		if current_station > 5
			first_leg = current_station - 5
			puts "You will need to transfer at Union Square after #{first_leg} stops."
		elsif # current_station < 5
			first_leg = 5 - current_station
			puts "You will need to transfer at Union Square after #{first_leg} stops."
		else # Already at Union Square
			first_leg = 0
		end
	
	elsif current_line == 2
		if current_station > 3
			first_leg = current_station - 3
			puts "You will need to transfer at Union Square after #{first_leg} stops."
		elsif current_station < 3
			first_leg = 3 - current_station
			puts "You will need to transfer at Union Square after #{first_leg} stops."
		else # Already at Union Square
			first_leg = 0
		end
	
	else # current_line == 3
		if current_station > 5
			first_leg = current_station - 5
			puts "You will need to transfer at Union Square after #{first_leg} stops."
		elsif current_station < 5
			first_leg = 5 - current_station
			puts "You will need to transfer at Union Square after #{first_leg} stops."
		else # Already at Union Square
			first_leg = 0
		end
	end
end


# WORK OUT FINAL LEG AFTER TRANSFERING AT UNION SQUARE

if current_station == destination_station
	print ""
elsif destination_line == 1
	if destination_station > 5
		final_leg = destination_station - 5
		puts "From Union Square, you will have #{final_leg} stops."
	elsif destination_station < 5
		final_leg = 5 - destination_station
		puts "From Union Square, you will have #{final_leg} stops."
	else # Destination is equal to Union Square
		final_leg = 0
	end

elsif destination_line == 2
	if destination_station > 3
		final_leg = destination_station - 3
		puts "From Union Square, you will have #{final_leg} stops."
	elsif destination_station < 3
		final_leg = 3 - destination_station
		puts "From Union Square, you will have #{final_leg} stops."
	else # Destination is equal to Union Square
		final_leg = 0
	end

elsif destination_line == 3
	if destination_station > 5
		final_leg = destination_station - 5
		puts "From Union Square, you will have #{final_leg} stops."
	elsif destination_station < 5
		final_leg = 5 - destination_station
		puts "From Union Square, you will have #{final_leg} stops."
	else # Destination is equal to Union Square
		final_leg = 0
	end
end

if current_station != destination_station
	puts "Your total trip will be #{first_leg + final_leg} stops."
end

puts "Happy travelling!"

# stations = {
# 	"line_n" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
# 	"line_l" => ["8th", "6th", "Union Square", "3rd", "1st"],
# 	"line_6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
# }