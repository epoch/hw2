# Basic arrays

# 1
puts "Create an array of the days of the week."
days_of_the_week = %w{ Monday Tuesday Wednesday Thursday Friday Saturday Sunday }

p days_of_the_week
puts

# 2
puts "Remove Sunday from the last postion and move it to the first position.  Use array methods."
bye_sunday = days_of_the_week.pop
days_of_the_week.unshift bye_sunday

p days_of_the_week
puts

# 3
puts "Create a new array of the days of the week."
sorted_days = [ days_of_the_week[1..5], [ days_of_the_week[6], days_of_the_week[0] ] ]

p sorted_days
puts

# 4
puts "Remove either the weekdays or the weekends."
sorted_days.pop

p sorted_days
puts

# 5
puts "Sort the remaining days alphabetically."
sorted_days.each {|i| puts "Finally, I got #{i.sort} in an alphabetical order." }

# p sorted_days.flatten.sort
puts

