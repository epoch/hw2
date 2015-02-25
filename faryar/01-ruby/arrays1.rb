bros = ["Groucho", "Chico", "Harpo"]
puts bros[0] # First bros, index 0 
puts bros[2] # Last bros, index 2 
puts bros.last # Also the last bros 
puts bros[-1] # Also the last bros 

puts ".shift"
cigar_smoker = bros.shift
p bros 

puts ".unshift"
bros.unshift cigar_smoker
p bros 

puts ".delete_at: Deleting Chico"
bros.delete_at 1 # vs bros[1] = nil 
p bros 

numbers = (1..100).to_a

cards = ["Ace of Spades", "Two of Clubs", "Queen of Hearts", "Four of Diamonds"]
p cards.shuffle
p cards.shuffle 

puts ".sample"
p cards.sample # cards.shuffle.first 
p cards.sample 2 

puts ".uniq" 
p [1,1,1,1,1,2,7].uniq 