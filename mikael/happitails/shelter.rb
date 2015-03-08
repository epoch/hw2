class Shelter
	attr_accessor :name, :animals, :clients
	def initialize(name)
		@name = name
		@animals = {}
		@clients = {}
	end

	def to_s
		"Name: #{@name}, Animals: #{@animals.count}, Clients: #{@clients.count}"
	end
end
