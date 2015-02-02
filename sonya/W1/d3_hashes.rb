# an array from earlier

bros = %w{ Groucho Harpo Chico } # quick way to create an array

bros.each do |name|
puts name + " Marx"
end


instruments['Groucho'] = 'guitar'
instruments['Harpo'] = 'harp'
instruments['Chico'] = 'piano'

puts instruments['Groucho']

# converting strings to symbols

instruments = {
	:groucho => 'guitar'
	:harpo => 'harp'
	:chico => 'piano'
}

# to call instruments

instruments[:groucho]

# to add more than one key value, create an array

instruments = {
	:groucho => ['guitar', 'harmonica']
	:harpo => 'harp'
	:chico => 'piano'
}
