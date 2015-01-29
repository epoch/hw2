names = ["John Smith", "Dan Boone", "Jennifer Jane", "Charles Lindy", "Jennifer Eight", "Rob Roy"]


# the comparison value will consists of the first and last name components split apart, reversed in order, and then joined together and uppercased:

sorted_names = names.sort_by do |name|
	name.split(" ").reverse.join.upcase
end

puts sorted_names.join('; ')

