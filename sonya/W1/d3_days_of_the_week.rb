# EXERCISE FOR arrays.rb
# 1 Create a variable named days_of_the_week as an array of the following:
# 2 Remove Sunday from the last postion and move it to the first position. Use array methods.
# 3 The first inner array should be the weekdays. The second inner array should be the weekend days
# 4 Remove weekdays
# 5 sort remaining days alpha

# # 1.
# days_of_the_week = [['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'], ['Saturday', 'Sunday']]

# puts 'No. 1'
# p days_of_the_week

# # 2.
# # sunday = days_of_the_week.pop
# # days_of_the_week.unshift sunday

# days_of_the_week.rotate

# puts 'No. 2'
# p days_of_the_week

# # 3. Added extra brackets to Array manually

# # 4. 

# days_of_the_week.delete_at(0)
# puts 'No. 4'
# p days_of_the_week.flatten

# # 5.

# days_of_the_week.sort
# puts 'No. 5'
# p days_of_the_week.flatten

# JOELS SOLUTION

# 1. Create array
days_of_the_week = %w{ Monday Tuesday Wednesday Thursday Friday Saturday Sunday }

# 2.
days_of_the_week.unshift days_of_the_week.pop

p days_of_the_week


# 3. 
new_days = [days_of_the_week[1..5], [days_of_the_week.last, days_of_the_week.first]]

p new_days

# 4. 
new_days.delete_at 0

p new_days

# 5. 
new_days.flatten.sort

p new_days














