def group_of(group_size, list)
	grouped_list = []
	until list.empty? || list.length < group_size
		grouped_list << list.shift(3)
	end

	p grouped_list

	until list.empty?
		grouped_list[-1] << list.shift
	end
	return grouped_list

	p grouped_list

end
p group_of(3, [:a, :b, :c, :d, :e, :f, :g])
