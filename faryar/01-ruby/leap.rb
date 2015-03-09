# Leap
# Write a program that will take a year and report if it is a leap year. The tricky thing here is that a leap year occurs:

# on every year that is evenly divisible by 4
#   except every year that is evenly divisible by 100
#     except every year that is evenly divisible by 400.
# For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.

# Your program should be called as follows:

# Year.new(1996).leap?
# Extensions

# Monkeypatch Fixnum to provide a leap_year? method:

# 2000.leap_year?




def leap_year?(year)
	if year % 4 == 0 && year % 100 != 0 
		true
	elsif year % 4 ==0 && year % 400 == 0
		true
	else 
		false
	end 
end 



puts leap_year?(1996)
puts leap_year?(1900)
puts leap_year?(1997)
puts leap_year?(2000)






