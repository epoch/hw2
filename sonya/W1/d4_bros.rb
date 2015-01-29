# create two hashes

instrument = {
	:groucho => 'guitar',
	:harpo => 'harp',
	:chico => 'piano'
}

vices = {
	:groucho => 'cigars',
	:harpo => 'hijinx',
	:chico => 'booze'
}

# # .each loop with an array

# [1, 2, 3].each do |n|
# 	puts "!" * n
# end

# .each loop with hash
# Prints out each bro and the instrument they play.
# Add .capitalize to bros
# these are called procedures

def plays(h)
	h.each do |bros, inst|
		puts "#{bros.to_s.capitalize} Marx plays the #{inst}"
	end
end

puts "=" * 50

def enjoys(h)
	h.each do |bros, naughty_thing|
		puts "#{bros.to_s.capitalize} Marx enjoys #{naughty_thing}"
	end
end


plays(instrument)
enjoys(vices)

