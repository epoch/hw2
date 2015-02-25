class Client
	attr_accessor :name, :num_children, :age, :num_pets

	def initialize(name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		@num_pets = []
	end
	# def success_msg
	# 	Rainbow("\nSuccess! #{@name} has been added to the database.\n\nYou will now be returned to the main menu.").green
	# end
end
