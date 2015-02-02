# Lottery :)

random = rand(10001)
puts "Pick a number between 0 and 10000! "
pick = gets.to_i

until pick == random
	if pick > 10000
		puts "Remember, between 0 and 10000! "
		pick = gets.to_i
		puts # To make the interpretation of the output easier
	elsif random < pick
		puts "Wrong, guess lower!"
		puts "Your number #{pick}, lucky number #{random}" # For illustration
		puts # To make the interpretation of the output easier
		pick = gets.to_i
	else random > pick
		puts "Wrong, guess higher!"
		puts "Your number #{pick}, lucky number #{random}" # For illustration
		puts # To make the interpretation of the output easier
		pick = gets.to_i 
	end
end

puts "Congrats!"
