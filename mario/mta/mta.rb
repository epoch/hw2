subways = {
	:n_line => ["Time Square", "34th", "28th N", "23rd N", "Union Square", "8th N"],
	:l_line => ["8th L", "6th", "Union Square", "3rd", "1st"],
	:six_line => ["Grand Central", "33rd", "28th 6", "23rd N", "Union Square", "Astor Place"]
}

start_line = :n_line
start_station = "Union Square"
finish_line = :n_line
finish_station = "34th"

start_index = subways[start_line].index(start_station)
finish_index = subways[finish_line].index(finish_station)

# Direction that the train travels
direction = 1
direction = -1 if finish_index < start_index

puts "Journey commencing."

# current_index is the index of the current station
arrived, counter = false, 0
current_line, current_index = start_line, start_index

until arrived do 
	puts subways[current_line][current_index]
	arrived = subways[current_line][current_index] == subways[finish_line][finish_index]
	current_index += direction
	counter += 1
end

puts "You have arrived at your destination."
puts "You travelled #{counter} stations."

