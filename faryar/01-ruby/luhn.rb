# Luhn Formula
# Write a program that can take a number and determine whether or not it is valid per the Luhn formula.

# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.

# For any digits that thus become 10 or more, subtract 9 from the result.

# E.g., 1111 becomes 2121, while 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).

# Add all these digits together. For example, if 1111 becomes 2121, then 2+1+2+1 is 6; and 8763 becomes 7733, so 7+7+3+3 is 20.

# If the total ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

# Write a program that, given a number

# a) can check if it is valid per the Luhn formula. b) can add a check digit to make the number valid per the Luhn formula.

# Luhn.new(2323_2005_7766_3554).valid?
# # => true

require 'pry'


class Luhn 
  attr_accessor :number

  def initialize(number)
    @number = number 
  end 

  def increment
    initialize(@number + 1)
  end

  def self.create(number)
    my_luhn = self.new(number * 10)
    until my_luhn.valid?
      my_luhn.increment
    end
    my_luhn.number
  end 

  def array 
    @number.to_s.split(//).map { |n| n.to_i }
  end 

  def check_digit 
    array.last
  end  

  def checksum
    added_numbers = addends.inject {|sum,x| sum + x }
    return added_numbers
  end 

  def valid? 
    checksum % 10 == 0
  end 

  def addends 
    new_array = [] 
    array.reverse.each_with_index do |n, i| 
      if i % 2 != 0 && n * 2 >= 10
        new_array << (n * 2 - 9) 
      elsif i % 2 != 0 && n * 2 < 10
        new_array << (n * 2) 
      elsif i % 2 == 0 
        new_array << (n) 
      end 
    end 
    return new_array.reverse
  end

end 


# binding.pry 


























































