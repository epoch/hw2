# 1. Create an array of the days of the week

# Create a variable named days_of_the_week as an array of the following:
# Monday
# Tuesday
# Wednesday
# Thursday
# Friday
# Saturday
# Sunday

# 2. My calendar says the first day is Sunday...

# Remove Sunday from the last postion and move it to the first position. Use array methods.

# 3. Create a new array of the days of the week:

# The first inner array should be the weekdays
# The second inner array should be the weekend days

# 4. Remove either the weekdays or the weekends

# Your choice...

# 5. Sort the remaining days alphabetically

days_of_the_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
p days_of_the_week


# days_of_the_week.pop
# p days_of_the_week
# days_of_the_week.unshift 'Sunday'
# p days_of_the_week

days_of_the_week.unshift days_of_the_week.pop #it has to be in this order 
p days_of_the_week

# days_of_the_week.rotate -1 



new_days = [days_of_the_week[1..5],[days_of_the_week.last, days_of_the_week.first]]
p new_days

new_days.pop
p new_days

new_days.flatten!.sort!
p new_days

# days_of_the_week2 = [['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'], ['Saturday', 'Sunday']]
# p days_of_the_week2

# days_of_the_week2.pop
# p days_of_the_week2

# days_of_the_week2.flatten!.sort!
# p days_of_the_week2


days_of_the_week3 = "Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday"
 p "Monday Tuesday Wednesday Thursday Friday Saturday Sunday".split(' ')


days_of_the_week3 = %w{ Monday Tuesday Wednesday Thursday Friday Saturday Sunday} # gives you back an array of strings 
p days_of_the_week3












