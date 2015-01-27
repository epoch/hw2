db = File.new("database.txt", "a+")

print "Would you like to add someone to the database? (y/n) "
response = gets.chomp.downcase

while response == "y"
  print "Enter name, age, gender: "
  db.puts gets.chomp # puts the users input to the database.txt file

  print "Would you like to add someone to the database? (y/n) "
  response = gets.chomp.downcase
end

db.close # need to close the file to avoid overwhelming amount of requests that would stuck the server

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name, @age, @gender = name, age, gender
  end

  def to_s
    "#{name} is #{age} years old and #{gender}."
  end
end

db = File.open("database.txt", "r")
people = []

db.each do |line|
  info = line.chomp.split /[, ]+/ # Regex
  person = Person.new info[0], info[1], info[2] # Splat this.

  people << person
end

db.close

people.each do |p|
  puts p.to_s
end

require "pry"
binding.pry





