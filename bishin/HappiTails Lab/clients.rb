class Clients
	attr_accessor :name, :num_children, :age, :pets

	def initialize (name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		@pets = []
	end

	def statement
		puts "#{ @name } is #{ @age } years old, has #{ @num_children } children and #{ @pets.length } pets"
	end
end




## How this class works ##

# For each item belonging to the class 'clients', there are instance variables (i.e. features) accessable being:
# - name
# - number of children
# - age
# - pets

# In the first instance, the default value of each feature for the client will be defined by:
# - variables (likely user input)
	# - name
	# - number of children
	# - age
# - empty array (still a variable)
# 	- pets
# 		The default value for 'animals' will be an empty array until such time user input is provided and then pushed into this array

