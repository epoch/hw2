class School

    attr_reader :db

    def initialize(name)
        @db = {}
        @name = name
    end
end

school = School.new("Haleakala Hippy School")

def add(name, grade)
    @db[grade] ||= [] # is shorthand to check if it's an arry, if not it will set it to an array
    @db[grade] << name
end

def grade(grade)
    @db[grade]
end

def sort
    @db = @db.sort.to_h # convert is back to a hash to sort
    @db.each { |grade, name| names.sort! } # sort it in a hash
end


### DT POSTED ONLINE

# class School

#   def initialize(name)
#     @name = name
#     @db = {}
#   end

#   def db
#     @db
#   end

#   def add(student, score)
#     db[score] ||= []
#     db[score] << student
#   end

#   def grade(score)
#     db[score]
#   end

#   def sort
#     db.sort.inject({}) do |memo, elem|
#       memo[elem.first] = elem.last.sort
#       memo
#     end
#   end

# end