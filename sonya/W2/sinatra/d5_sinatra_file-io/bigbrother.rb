# File Input Output

db = File.new('database.txt', 'a+')

print "Would you like to add someone to the database? (y/n): "
response = gets.chomp.downcase

# do a loop while the response is yes

while response == 'y'
    print "Enter the name, age and gender: "
    db puts gets.chomp

    # instead of put on the terminal, we're putting it into the file
    # puts "You said: #{ person }"

    print "Would you like to add someone to the database? (y/n): "
    response = gets.chomp.downcase
end

db.close

## END OF DATABASE CLOSE SECTION

# create a person class and a 'convert to string class' so we can have instances of 

class Person
    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
        @name, @age, @gender = name, age, gender
    end

    def to_s
        "#{ name } is #{ age } years old and #{ gender }."
    end
end


## START OF DATABASE READ SECTION

# reopen file in different mode - 'r'

db = File.open('database.txt', 'r')
people = []

# ruby reads database as an array line by line
# You can use db.each do |line|
db.each do |line| 
    info = line.chomp.split /[, ]+/
    person = Person.new info[0], info[1], info[2] # split removes spaces in the input #Splat this *info
    people << person
end

db.close

people.each do |p|
    puts p.to_s
end
