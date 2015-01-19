require_relative 'client'
require_relative 'animal'

class Shelter
	attr_accessor :clients, :animals

	def initialize
		@clients = []
		@animals = []
	end

	def display_clients
		puts "Here are the clients on record: "
		puts clients
	end

	def display_animals
		puts "Animals adopted by clients:"
		clients.each do |client|
			client.pets.each {|pet| puts pet.name}
		end

		if animals.empty?
			puts "No animals available for adoption."
		else		
			puts "\nAnimals up for adoption:"
			animals.each {|animal| puts animal.name}
		end
	end
end


