instrument = {
	:groucho => 'guitar',
	:harpo => 'harp',
	:chico => 'piano'
}

vice = {
	:groucho => 'cigars',
	:harpo => 'hijinx',
	:chico => 'booze'
}

# Prints out each brother and the instrument they play
def plays(h)
	h.each do |bros, inst|
		puts "#{bros.to_s.capitalize} Marx plays the #{inst}"
	end
end

plays(instrument)

def enjoys(a)
	a.each { |bros, bad_habit| puts "#{bros.to_s.capitalize} Marx enjoys #{bad_habit}" }
end

enjoys(vice)

########################################################################

class MarxBrother
	attr_accessor :name, :instrument, :vice

	def initialize(name, instrument, vice)
		@name = name
		@instrument = instrument
		@vice = vice

		def play
			"#{ @name } Marx plays the #{ @instrument }"
		end

		def enjoy
			"#{ @enjoy } Marx enjoys #{ @vice }"
		end
		
	end
end

groucho = MarxBrother.new("Groucho", "Guitar", "Cigars")

require 'pry'
binding.pry
