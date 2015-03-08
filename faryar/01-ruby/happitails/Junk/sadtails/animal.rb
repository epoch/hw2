class Animal 
attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species, toys=0)
		@name = name 
		@age = age 
		@gender = gender 
		@species = species 
		@toys = toys 
	end 

	def to_s 
		puts "#{@name}is a #{@age}-year-old #{@species} who has the following toys #{@toys}."
	end

end 