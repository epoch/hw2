require_relative 'client'
require_relative 'animal'

class Shelter
	attr_accessor :clients, :animals

	def initialize
		@clients = []
		@animals = []
	end

	def display_clients
		@clients.each { |client| puts client }
	end

	def display_animals
		@clients.each { |client| puts client.display_pets }
	end
end