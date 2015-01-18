class Scrabble
	attr_accessor :word

	def initialize
		print "Please enter a word or letter: "
		@word = gets.chomp
	end

	def score
		# this can be done in a simpler way, with k/v of 'a' => 1, 'b' => 3 etc.
		# you can't have multiple keys for a value, but you can store all of the letter in a single string as a key (and then look up)
		# you cant strictly have multiple keys, but there are work arounds
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