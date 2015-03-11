# Title: Guess The Number
# Activity:

# You are to generate a basic "guess my number" game. The computer will pick a random number between 0 and 10. The user will guess the number until they guess correctly.
# Specification:

# The user should be asked to guess a number
# If the user's guess is correct, the user should see a congratulatory message
# If the user's guess is not correct, the user should be asked to guess the number again.
# Extensions:

# Let the user choose the maximum value (so they can play a long game with a random value between 0 and 10000, for example).
# Give feedback to the user: "Wrong, guess higher!" or "Wrong, guess lower!"

puts "Let's play a game! Try to pick the same number as me!"
puts "What do you want the upper range to be?"
UPPER_RANGE = gets.to_i

puts "Guess a number!"
guess = gets.to_i

# +1 because it means up to and including the upper range 
computer = Random.rand(UPPER_RANGE + 1)
while (computer) != (guess) 
		if computer > guess 
			puts "Guess higher!"
		elsif computer < guess
			puts "Guess lower!" 
		end

guess = gets.to_i
end 

	
puts "Congrats! We chose the number #{computer}, too!"









