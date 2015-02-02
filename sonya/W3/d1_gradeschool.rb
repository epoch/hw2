# require 'pry'

db = File.new('gradeschool.txt', 'a+')

print "Would you like to add a student to the database? (y/n)"
response = gets.chomp.downcase

while response == 'y'
    print "Enter name, grade: "
    db.puts gets.chomp

    print "Would you like to add another student to the database? (y/n) "
    response = gets.chomp.downcase
end

db.close

class School
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

school = School.new("Haleakala Hippy School")
school = []

class Student
    attr_accessor :name, :grade

    def initialize(name, grade)
        @name, @grade = name, grade
    end

    def to_s
        "#{ name } is in #{ grade } grade."
    end
end

db = File.open('gradeschool.txt', 'r')
student = []

db.each do |line|
    info = line.chomp.split /[, ]+/
    student = Student.new info[0], info[1]
    school << student
end

db.close

school.each do |p|
    puts p.to_s
end

# binding.pry
