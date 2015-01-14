def select_line
	puts "1. N Line\t 2. L Line\t 3. 6 Line"
	choice = gets.to_i
	case choice
	when 1
		return :n_line
	when 2
		return :l_line
	when 3
		return :six_line
	else
		puts "Invalid choice."
		sleep 1
		select_line
	end
end

puts " S U B W A Y  S I M U L A T O R ".center(80, ?=)
puts "Please select the line of your starting station."
start_line = select_line
print "What is your start station? "
start_station = gets.chomp
puts "Please select the line of your finish station."
finish_line	= select_line
print "What is your finish station? "
finish_station = gets.chomp
puts "Journey commencing.".center(80, ?-)

# simulate a journey on one line
def journey(line, start, finish)
	counter = 0 # Counter for the number of stations travelled
	subways = {
	:n_line => ["Time Square", "34th", "28th N", "23rd N", "Union Square", "8th N"],
	:l_line => ["8th L", "6th", "Union Square", "3rd", "1st"],
	:six_line => ["Grand Central", "33rd", "28th 6", "23rd N", "Union Square", "Astor Place"]
    }	

	start_index = subways[line].index(start)
	finish_index = subways[line].index(finish)

	# Direction that the train travels
	direction = 1
	direction = -1 if finish_index < start_index

	# current_index is the index of the current station
	arrived = false
	current_index = start_index

	until arrived do 
		puts subways[line][current_index]
		arrived = subways[line][current_index] == subways[line][finish_index]
		current_index += direction
		counter += 1
		sleep 0.5
	end
	return counter
end

counter = 0
if start_line == finish_line
	counter = journey(start_line, start_station, finish_station)
else
	counter += journey(start_line, start_station, "Union Square")
	puts "\nSwitching Lines\n\n"
	sleep 1
	counter += journey(finish_line, "Union Square", finish_station)
end
sleep 1
puts "\nYou have arrived at your destination."
puts "You travelled #{counter} stations."
