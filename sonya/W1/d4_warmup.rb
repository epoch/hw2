require 'pry'

# write a method group_by + give it a number
# write an array with 6 people
# write nested array for number you give to the method
# ensure any remainders are added to the last nested array


# students = ["Sox", "TJ", "Xander", "Mario", "Tom"]

# def groups_by(num, students)
# 	new_students = []

# end

# p new_students

binding.pry

# Mario's solution

def group_of(group_size, list)
	grouped_list = []
	until list.empty? || list.length < group_size
		grouped_list << list.shift(group_size)
	end
	until list.empty?
		grouped_list[-1] << list.shift
	end
	return grouped_list
end

p group_of(3, [:a, :b, :c, :d, :e, :f, :g])

# DT's solution on GitHub each.slice
