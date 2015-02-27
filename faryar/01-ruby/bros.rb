instrument = {
	:groucho => "guitar", 
	:harpo => "harp",
	:chico => "piano"
}

vice = { 
	:grouhco => "cigars", 
	:harpo => "hijinx", 
	:chico => "booze"
}

# Prints out each brother and the instrument they play 
def plays(h)
	h.each do |bros, inst|
		puts " #{bros.to_s.capitalize} Marx plays the #{inst}."
	end 
end 

plays(instrument)

puts "=" * 80 

def enjoys(h)
	h.each do |bros, naughty_thing|
		puts " #{bros.to_s.capitalize} Marx really enjoys #{naughty_thing}."
	end
end 

enjoys(vice)

require "pry"

binding.pry

# [1,2,3].each do |n|
# 	puts "!" * n 
# end 