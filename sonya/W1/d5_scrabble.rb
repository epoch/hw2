# Write a program that, given a word, computes the scrabble score for that word.

# INSTRUCTIONS POINT FROM DT

# class Scrabble
# s = Scrabble.new
# s.score (" ")

# AIM / OUTPUT
# Scrabble.new.score("cabbage")
# # => 14

# STEP ONE: Create a gets to grab user's word
# STEP TWO: Convert user_word to a string or an array!?!
# STEP THREE: Create hash which stores the score of every letter
# STEP FOUR: Create method score(letter, score)
# STEP FIVE: .each loop with hash

puts "Type a word to score"
word = gets.chomp

points = {
	'a'=> 1, 
	'b'=> 3, 
	'c'=> 3, 
	'd'=> 2, 
	'e'=> 1, 
	'f'=> 4, 
	'g'=> 2, 
	'h'=> 4, 
 	'i'=> 1, 
 	'j'=> 8, 
 	'k'=> 5, 
 	'l'=> 1, 
 	'm'=> 3, 
 	'n'=> 1, 
 	'o'=> 1, 
 	'p'=> 3,
 	'q'=> 10, 
 	'r'=> 1, 
 	's'=> 1, 
 	't'=> 1, 
 	'u'=> 1, 
 	'v'=> 4, 
 	'w'=> 4, 
 	'x'=> 8, 
 	'y'=> 4, 
 	'z'=> 10
}

# value_of_letter
total = 0 
word.each_char do |letter|
  total += points[letter]
end

puts "The scrabble score of #{ word } is #{ total }."



