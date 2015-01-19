class Animals
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize (name, age, gender, species)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = []
	end

	def statement
		puts "#{@name} is a #{ @gender } #{ @species } who is #{ @age } years old and owns #{@toys.length } toys, being #{ @toys.join(' ') }"
	end

end



## How this class works ##

# For each item belonging to the class 'Animals', there are instance variables (i.e. features) accessable being:
# - name
# - age
# - gender
# - species
# - toys

# In the first instance, the default value of each feature for the animal will be defined by:
# - variables (likely user input)
# 	- name
# 	- age 
# 	- gender
# 	- species
# - empty array (still a variable)
# 	- toys
# 		The default value for 'toys' will be an empty array until such time user input is provided and then pushed into this array

