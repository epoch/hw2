class Shelter
	attr_accessor :animals, :clients, :name, :num_animals, :num_clients, :num_total_animals

	def initialize(name)
		@name = name
		# to store animal and client objects
		@animals = []
		@clients = []
		@num_clients = @clients.length
		@num_animals = @animals.length
	end

	def total_animals
		total = 0
		@clients.each do |client|
			total += @num_pets
		end
	end

	def to_s
		animal_count = total_animals
		puts "The #{@name} shelter has #{animal_count} animals and #{@num_clients} clients."
	end
end
