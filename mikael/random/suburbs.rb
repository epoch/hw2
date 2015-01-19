###3. Sydney Suburbs
# - Create a program that asks what suburbs you live in.
# - Depending on the answer, print an appropriate response of your choosing

print "Which city do you live in? "
city = gets.chomp.downcase

# if city == "Helsinki" || city == "Clearwater"
# 	puts "Good!"
# elsif city == "Tokyo" || city == "Soul"
# 	puts "Exciting!"
# elsif city == "Sydney"
# 	puts "Fun!"
# else
# 	puts "That is very sad!"
# end

case city
when "helsinki"
	puts "Good!"
when "clearwater"
	puts "Spiritual"
when "tokyo"
	puts "Modern!"
when "soul"
	puts "Advanced"
when "sydney"
	puts "Fun!"
else
	puts "That is very sad!"
end
