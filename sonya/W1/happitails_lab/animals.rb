class Animals

	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species, toys)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys
	end

  	def add_toy(toy)
    	@toys << toy
  end

	def to_s
		"#{ @species }, #{ @name } is #{ @gender } and loves to play with: #{ @toys.join(", ") }."
	end

end



