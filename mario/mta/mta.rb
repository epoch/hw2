subways = {
	:n_line => ["Time Square", "34th", "28th N", "23rd N", "Union Square", "8th N"],
	:l_line => ["8th L", "6th", "Union Square", "3rd", "1st"],
	:six_line => ["Grand Central", "33rd", "28th 6", "23rd N", "Union Square", "Astor Place"]
}


start_station = "Union Square"
finish_station = "34th"

start_index = subways[:n_line].index(start_station)
finish_index = subways[:n_line].index(finish_station)

# Direction that the train travels
direction = 1
direction = -1 if finish_index < start_index

puts "Journey commencing."

# current_index is the index of the current station
arrived, current_index, counter = false, start_index, 0

until arrived do 
	puts subways[:n_line][current_index]
	arrived = subways[:n_line][current_index] == subways[:n_line][finish_index]
	current_index += direction
	counter += 1
end

puts "You have arrived at your destination."
puts "You travelled #{counter} stations."

