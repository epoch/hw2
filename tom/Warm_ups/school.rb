class School

  attr_reader :db

  def initialize(name)
    @name = name
    @db = {}
  end

  def add(student, grade)

    # check if a grade k/v exists (where v is array)
    # if not, make one, if it does exist append student
    unless @db[grade]
      @db[grade] = []
      @db[grade] << student
    else
      @db[grade] << student
    end

    # the above can be refactored with @db[grade] ||= []
    # this will be skipped if the relevant array already exists, so:
    # @db[grade] ||= []
    # @db[grade] << student
  end

  def grade(grade)
    puts @db[grade]
  end
end

school = School.new("Haleakala Hippy School")
school.db

p school.add("Tom", 5)
p school.add("Matt", 4)
school.db

require 'pry'
binding.pry