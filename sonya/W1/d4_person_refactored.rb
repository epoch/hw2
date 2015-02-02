require 'pry'

class Person
# attr_accessor:age does the setter and getter easily (access the attributes)
attr_accessor :age, :gender, :name
    
    def initialize(age, gender, name)
        puts "Look at me I am initializing"
        @age = age
        @gender = gender
        @name = name
    end

    def to_s
        "#{ @name } is a #{ @age } year old who is #{ @gender }"
    end
end

# How to call the Person
# sox = Person.new(37, 'female', "Sox")

