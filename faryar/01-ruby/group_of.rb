# write a method that takes a list, list = [a,b,c,d,e,f], 
# and breaks it up into groups within the array 
# ex: groups_of(3,list)
# ==> [[a,b,c],[d,e,f,g]]
# ex2: groups_of(2,list)
# ==> [[a,b],[c,d][e,f,g]]
 

def group_of(group_size, list)
	grouped_list = []
	until list.empty? || list.length < group_size
		grouped_list << list.shift(group_size)
	end
	until list.empty?
		grouped_list[-1] << list.shift #this is how remainder joins the last group
	end
	return grouped_list
end

p group_of(3, [:a, :b, :c, :d, :e, :f, :g])


# 2nd way 

# def groups_of(n, array)
#     if array.count % n == 0
#         p array.each_slice(n).to_a
#     else
#         grouped_array = list_array.each_slice(n).to_a
#         grouped_array.slice(-1)
#         grouped_array[-2] << grouped_array[-1]
#         grouped_array[-2].flatten!
#         grouped_array.pop
#         p grouped_array
#             end
# end


# 3rd way 

































