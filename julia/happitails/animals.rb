class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = []
	end

	# def success_msg
	# 	Rainbow("\nSuccess! #{@name} has been added to the database.\n\nYou will now be returned to the main menu.").green
	# end
end