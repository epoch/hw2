# Needs to take an argument (an integer) and then split a single array into n number of arrays
# If there is an odd number then we need it to append the last element to the last nested array (making it n + 1)

names = ['amy', 'faryar', 'tj', 'may', 'xander', 'liam', 'tom']

def groups_of(array, n)
	# sorts them into separate arrays
	 array = array.each_slice(n).to_a

	 # checks if last array contains a single element
	 if array[-1][1] == nil
	 	array[-2] << array [-1][0]
	 	array.pop
	 	print array
	 	puts "\n"
	 end
	
end

groups_of(names, 3)
# => [["amy", "faryar", "tj"], ["may", "xander", "liam", "tom"]]

groups_of(names, 2)
# => [["amy", "faryar"], ["tj", "may"], ["xander", "liam", "tom"]]