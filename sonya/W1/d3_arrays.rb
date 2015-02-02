bros = ['Groucho', 'Chico', 'Harpo']
puts bros[0] # First bros, index 0
puts bros[2] # First bros, index 2
puts bros.last # Last bros
puts bros[-1] # Last bros - -1 counts from the end

puts "#DEMO .shift" # removes at start
cigar_smoker = bros.shift
p bros

puts "#DEMO .unshift" # adds at start
bros.unshift cigar_smoker
p bros

puts '#DEMO .delete_at' # deletes at position specified
bros.delete_at 1
p bros

numbers = (1..100).to_a.reverse
p numbers

cards = ['Ace of Spades', 'Two of Clubs', 'Queen of Hearts']

p cards.shuffle
p cards.shuffle

puts '# DEMO .sample'

p cards.sample # same as cards.shuffle.first

puts '#DEMO .uniq'

p [1, 1, 1, 1, 1, 2, 7].uniq # shows unique values i.e removes dublicates

# Adding to arrays

bros = %w{ Groucho Harpo Chico } # quick way to create an array

bros.each do |name|
puts name + " Marx"
end









