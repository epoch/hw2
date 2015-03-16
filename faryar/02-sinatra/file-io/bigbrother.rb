db = File.new('database.txt', 'a+') # or db = File.open('database.txt', 'a+')

print "Would you like to add someone to the database? (y/n) "
response = gets.chomp.downcase

while response == 'y'
    print "Enter the name, age, gender: "
    db.puts gets.chomp 
   
    print "Would you like to add someone to the database? (y/n) "
    response = gets.chomp.downcase
end 

db.close 
# End of database add section 


class Person 
    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
        @name, @age, @gender = name, age, gender
    end 

    def to_s 
        "#{ name } is #{ age }-years-old and #{ gender }"
    end
end 


# Beginning of database read section 
db = File.new('database.txt', 'r')
people = []

db.each do |line| 
    info = line.chomp.split(',') # .split /[, ]+/ another way to split with comma or space 
    person = Person.new(info[0].strip, info[1].strip, info[2].strip) #Splat this. (for more info)

    people << person 
end 

db.close 

people.each do |p|
    puts p.to_s
end 

require 'pry'
binding.pry



