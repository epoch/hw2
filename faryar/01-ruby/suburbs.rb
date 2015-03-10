# Sydney Suburbs
# 	•	Create a program that asks what suburbs you live in.
# 	•	Depending on the answer, print an appropriate response of your choosing


# print "What Sydney suburb do you live in? "
# answer = gets.chomp.downcase 


# case answer 
# when "bondi", "coogee"
# 	puts "Great surf!"
# when "surry hills", "darlinghurst"
# 	puts "Close to school!"
# when "palm beach", "avalon" 
# 	puts "So hipster!"
# when "newton"
# 	puts "Very nice!"
# else 
# 	puts "I don't know where that is...."
# end 

# ^^^^ old way of doing this exercise without method/function 

def suburb(suburb) 
	if suburb == "bondi" || suburb == "coogee"
		puts "Great surf!"
	elsif suburb ==  "surry hills" || suburb == "darlinghurst"
		puts "Close to school!"
	elsif suburb == "palm beach" || suburb == "avalon" 
		puts "So hipster!"
	elsif suburb == "newton"
		puts "Very nice!"
	else 
		puts "I don't know where that is...."
	end
end 

suburb("bondi")
suburb("palm beach")

