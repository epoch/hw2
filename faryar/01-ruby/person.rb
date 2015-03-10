
# require 'pry'

# #this is an instance variable
# # show that this variable is important by putting a hat on it 
# #remember this variable! 

# class Person 

# 	# Setter 
# 	def age=(age)
# 		@age = age     
# 	end 

# 	# Getter 
# 	def age 
# 		@age 
# 	end

# 	# Setter 
# 	def gender=(gender)
# 		@gender = gender 
# 	end 

# 	# Getter 
# 	def gender 
# 		@gender 
# 	end 

# 	# Setter 
# 	def name=(name)
# 		@name = name 
# 	end 

# 	# Getter 
# 	def name 
# 		@name 
# 	end 

# end 
# binding.pry 

# # Setter helps us set someone's age 
# # Getter helps us gets someone's age later on 



# class Person 
# 	attr_accessor :age, :gender, :name

# 	def initialize(age, gender, name)
# 		@age = age 
# 		@gender = gender 
# 		@name = name 
# 	end 


# end 




class MarxBrother # need to use CamelCase 
	attr_accessor :name, :instrument, :vice

	def initialize(name, instrument, vice)
		@name = name 
		@instrument = instrument 
		@vice = vice 
	end 
	

	def play
		"#{@name} Marx plays the #{@instrument}." 
	end 
end 

require 'pry'
binding.pry






