n_line = ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"]

start_station = "Union Square"
finish_station = "34th"

start_index = n_line.index(start_station)
finish_index = n_line.index(finish_station)

# Direction that the train travels
direction = 1
direction = -1 if finish_index < start_index

puts "Journey commencing."

# current_index is the index of the current station
arrived, current_index, counter = false, start_index, 0

until arrived do 
	puts n_line[current_index]
	arrived = n_line[current_index] == n_line[finish_index]
	current_index += direction
	counter += 1
end

puts "You have arrived at your destination."
puts "You travelled #{counter} stations."

