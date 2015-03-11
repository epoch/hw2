# Scrabble Score
# Write a program that, given a word, computes the scrabble score for that word.

# Scrabble.new.score("cabbage")
# # => 14
# Your program should be in a file named scrabble.rb.

# Letter Values

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Extensions

# You can play a :double or a :triple letter.
# You can play a :double or a :triple word.









# My work (

# 	# def score(word) 
# 	# 	word.split(" ")
# 	# end 

# 	# "hello".score 


# # input = "cabbage"
# # # values = input.split(",")
# # # p values 


# # input.split(/\L+/)
# # p input
# # scrabble =  %w{ word }

# *********************************************************

# input = "cabbage"
# p input.upcase.split('')
# p input.length 

# scrabble = []
# scrabble << input.split('')
# scrabble.flatten!
	
# p scrabble
# letter = scrabble.at(0)

# hash = { 
# 	1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
# 	2 => ["D", "G"], 
# 	3 => ["B", "C", "M", "P"],
# 	4 => ["F", "H", "V", "W", "Y"],
# 	5 => ["K"],
# 	8 => ["J", "X"],
# 	10 => ["Q", "Z"],
# }

# p hash.index("C") 

# # p hash.key(letter)

# ***********************************************************

# # class Scrabble 

# # 	def score
# # 	end 



# # end ) 


# May's method: 

class Scrabble
 attr_accessor :word
 def initialize(word)
   @word = word
 end


 def score
     number = 0
     l_to_n = {'c'=> 3, 'a' => 1, 'b' => 3, 'g' => 2, 'e' => 1}
   letters = @word.split(//)
   letters.each {|i| number +=l_to_n[i].to_i}
    puts "The score is #{number}."
 end

end

p cal = Scrabble.new("cabbage")
p cal.score



# Sox's method: 

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


# Nick's method: 

class Scrabble
	attr_accessor :word

	def initialize
		print "Please enter a word or letter: "
		@word = gets.chomp
	end

	def score
		# this can be done in a simpler way, with k/v of 'a' => 1, 'b' => 3 etc.
		# you can't have multiple keys for a value, but you can store all of the letter in a single string as a key (and then look up)
		scoreboard = {
			1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
			2 => ['d', 'g'],
			3 => ['b', 'c', 'm', 'p'],
			4 => ['f', 'h', 'v', 'w', 'y'],
			5 => ['k'],
			8 => ['j', 'x'],
			10 => ['q', 'z']
		}
		score = 0
		word = @word
		# turn the given word into an array of letters
		array = @word.split('')
		# iterate over the each letter in the word
		array.each do |a|
			# iterates over the hash
			scoreboard.each do |k, v|
				# checks if the letter is present in the hash's array value
				if  scoreboard[k].include? a 
					# if it is, the key (an int) is added to the score
					score += k
				end
			end
			
		end
		puts "#{word} is worth #{score} points."
	end
end

puts 'Welcome to Scrabble Score Checker!'
word = Scrabble.new
puts "\n"
word.score





















