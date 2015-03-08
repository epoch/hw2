# currently only works with the N line hardcoded
# accepts current station and destination inputs
# doesn't seem to like strings with spaces in them
# goes backwards successfully

# subway stations are stored in a hash
subway = {
	'N' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '3rd', '1st'],

	'L' => ['8th', '6th', 'Union Square', '3rd', '1st'],

	'6' => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}

# save this for when I figure out how to use other lines as hash keys
# print "Please enter the line you are on: "
# user_line = gets.chomp.capitalize

# finds the index of user_station
print 'Please enter your current station: '
user_station = gets.chomp

start = subway['N'].index {|x| x == user_station}

# finds the index of user_destination
print 'Please enter your destination: '
user_destination = gets.chomp.capitalize

finish = subway['N'].index {|x| x == user_destination}

# next we need to compare the two indexes
if start < finish
	stop_count = finish - start
else
	stop_count = start - finish
end

puts "You need to stay on for #{stop_count} stops."

# loops through every value/index pair in the array of stations for the line in question
# checks each index to see if it is within the range of start to finish (variables containing the relevant indexes)
reverse_array =[]
# prints out relevant variables
print "You will pass "
subway['N'].each_with_index do |v, i| 
	if start < finish 
		unless i <= start || i > finish
			if i == finish
				print 'and end your journey at ' + v + '.'
				print "\n"
			else
				print v + ', '
			end		
		end
	# when finish > start
	else
		# puts the relevant items in an array
		unless i >= start || i < finish
			reverse_array << v
		end
	end
end

# to avoid messing with an already working loop above:
# - if statement checks to see if we're going backwards
# - reverses the stops
# - prints out the reversed stops
if finish < start
	reverse_array.reverse!
	
	reverse_array.each_with_index do |v, i|
		if i != reverse_array.index(reverse_array.last)
			print v + ', '
		else
			print 'and end your journey at ' + v + '.'
			print "\n"
		end

	end
end

# next step is to figure out how to input a line to travel on