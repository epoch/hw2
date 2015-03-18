# when going for 2 legs
subway = {
	'N' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '3rd', '1st'],

	'L' => ['8th', '6th', 'Union Square', '3rd', '1st'],

	'6' => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}

# define index values for U sq. on each line
# currently prints the value, we want the index
# subway['N'][4]
union_n = 4

# subway['L'][2]
union_l = 2

# subway['6'][4]
union_6 = 4



# hash.each_with_index { |(key,value),index| ... }

# lists the lines
subway.each_with_index do |(k, v), i|
	puts "#{i + 1}. #{k}"
end
# finds user line
print 'Please enter the line you are on: '
user_line = gets.chomp

# if they've picked n line
# it should only list n line array values
# should cycle through the relevant array
subway[user_line].each_with_index do |v, i|
	puts "#{i + 1}. #{v}"
end

# finds the index of user_station
print 'Please enter your current station: '
user_station = gets.chomp


subway.each_with_index do |(k, v), i|
	puts "#{i + 1}. #{k}"
end
# finds out the destination line
print 'Please enter your destination line: '
end_line = gets.chomp

subway[end_line].each_with_index do |v, i|
	puts "#{i + 1}. #{v}"
end
# finds the index of user_destination
print 'Please enter your destination station: '
user_destination = gets.chomp





# need to find a way to plug in user values to check the subway hash
if user_line == end_line

	start = subway['N'].index {|x| x == user_station}

	finish = subway['N'].index {|x| x == user_destination}

	# next we need to compare the two indexes
	if start < finish
		stop_count = finish - start
	else
		stop_count = start - finish
	end

	puts "You need to stay on for #{stop_count} stop(s)."

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

	# - if statement checks to see if we're going backwards, reverses stops and prints out the reversed stops
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

else
	# if it involves a line change, 2 legs need to calculated:
	# 1. user station index to U.sq index on their current line (latter needs to be a constant for each line)
	# 2. U sq. index on end line to user destination on end line

	# just going forwards atm

	# defines ending index value of the first leg, depending on user_line
	intersection_2 = nil
	if user_line == 'N'
		intersection_1 = union_n
	elsif user_line == 'L'
		intersection_1 = union_l
	else
		intersection_1 = union_6
	end

	# defines starting index value of the second leg, depending on the end_line
	if end_line == 'N'
		intersection_2 = union_n
	elsif end_line == 'L'
		intersection_2 = union_l
	else
		intersection_2 = union_6
	end


	# calculates first leg stops
	start_station = subway[user_line].index {|x| x == user_station}

	if start_station < intersection_1
		stops_leg_1 = intersection_1 - start_station
	else
		stops_leg_1 = start_station - intersection_1
	end

	# calculates second leg stops
	end_station = subway[end_line].index {|x| x == user_destination}

	if end_station < intersection_2
		stops_leg_2 = intersection_2 - end_station
	else
		stops_leg_2 = end_station - intersection_2
	end

	stop_count = stops_leg_1 + stops_leg_2
	puts "You need to stay on for #{stops_leg_1} stop(s), change at Union Square, and then stay on for another #{stops_leg_2} stop(s)."
	# print "You will pass "

	# loop through initial line's array of relevant stops and print them
	# puts "You will change at Union Square"
	# print "You will then pass "
	# loop through second line's array of relevant stops


end


# tells you the number of stops and prints the stops on a single line journey
# tells you the number of stops on a 2 leg journey, needs to print the stops though. Does it?