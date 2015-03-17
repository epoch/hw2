# Grade School
# Write a small archiving program that stores students along with the grade that they are in.

# school = School.new("Haleakala Hippy School")
# If no students have been added, the db should be empty:

# school.db
# # => {}
# When you add a student, they get added to the correct grade.

# school.add("James", 2)
# school.db
# # => {2 => ["James"]}
# You can, of course, add several students to the same grade, and students to different grades.

# school.add("Phil", 2)
# school.add("Jennifer", 3)
# school.add("Little Billy", 1)
# school.db
# # => {2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]}
# Also, you can ask for all the students in a single grade:

# school.grade(2)
# # => ["James", "Blair"]
# extension
# Lastly, you should be able to get a sorted list of all the students. Grades are sorted in descending order numerically, and the students within them are sorted in ascending order alphabetically.

# school.sort
# # => {1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]}


class School 
    attr_reader :database

    def initialize(school_name)
        @school_name = school_name
        @database = {}
    end 

    def add(name, grade)
        @database[grade] ||= []
        @database[grade] << name
    end  

    def grade(grade)
        @database[grade] 
    end 

    def db 
        @database
    end 

    def sort 
        # @database = @database.sort.to_h 
        @database.each { |grade, name| name.sort! }.sort.to_h
    end 

    def to_s 
        "#{ school_name } has been added to the database."
    end 
end 


require 'pry'
binding.pry



















