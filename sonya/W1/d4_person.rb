require 'pry'

# The quick way is to initialize

class Person
    def initialize(age, gender, name)
        puts "Look at me I am initializing"
        @age = age
        @gender = gender
        @name = name
    end

sox = Person.new(37, 'female', "Sox")

class Person
    def set_age(age)
    # this is an instance variable, @ is called a hat and you hang onto it
    # show variable is NB by putting a hat on it
    	@age = age
    end

    def get_age
    	@age
    end

    def get_age_next_year
    	@age + 1
    end
end

craigsy.set_age(25)

binding.pry

# Refactored

class Person
    def age=(age)
    	@age = age
    end

    def age
    	@age
    end

    def age_next_year
    	@age + 1
    end
end

craigsy.age = 25

# Adding another variable to keep track of - their gender

class Person
	# Age setter
    def age=(age)
    	@age = age
    end
    # Age getter
    def age
    	@age
    end

    def gender=(gender)
    	@gender = gender
    end

    def gender
    	@gender
    end

   def name
		@name=(name)
	end

	def name
		@name
	end

end

jonsey = Person.new
jonsey.age = 45
jonsey.gender = 'male'

# call it

jonsey.age
jonsey.gender





