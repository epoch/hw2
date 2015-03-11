# Say
# Write a program that will take a number from 0 to 99 and spell out that number in English.

# In other words, if the input to the program is 22, then the output should be 'twenty-two'

# e.g.

# Say.new(22).in_english
# Say.new(-1).in_english
# # say.rb:7:in 'in_english': Number must be between 0 and 99, inclusive. (ArgumentError)
# The program must also report any values that are out of range.

# Some good test cases for this program are:

# 0
# 14
# 50
# 98
# -1
# 100
# Extensions

# Shell out to Mac OS X's program to talk out loud.

require 'numbers_and_words'

class Say 
    attr_accessor :number 

    def initialize(number)
        @number = number 
    end 

    def in_english
        if number.to_i.between?(1,99)
            number.to_words
        else 
            "This number is not within the range."
        end 
    end 
end 



puts Say.new(0).in_english

puts Say.new(14).in_english

puts Say.new(50).in_english

puts Say.new(98).in_english

puts Say.new(-1).in_english

puts Say.new(100).in_english


# Mario's Solution 

class Say

    ENGLISH_NUMBERS = {
        0  => "zero",
        1  => "one",
        2  => "two",
        3  => "three",
        4  => "four",
        5  => "five",
        6  => "six",
        7  => "seven",
        8  => "eight",
        9  => "nine",
        10 => "ten",
        11 => "eleven",
        12 => "twelve",
        13 => "thirteen",
        14 => "fourteen",
        15 => "fifteen",
        16 => "sixteen",
        17 => "seventeen",
        18 => "eighteen",
        19 => "nineteen",
        20 => "twenty",
        30 => "thirty",
        40 => "fourty",
        50 => "fifty",
        60 => "sixty",
        70 => "seventy",
        80 => "eighty",
        90 => "ninety"
    }

    def initialize(number)
        @number = number
    end

    def in_english
        if @number < 0 || @number > 99
            raise ArgumentError
        elsif @number <= 20 || @number%10 == 0
            ENGLISH_NUMBERS[@number]
        else
            ENGLISH_NUMBERS[10 * (@number / 10)] + "-" + ENGLISH_NUMBERS[@number % 10]
        end    
    end

end

puts Say.new(14).in_english

# DT's solution 

class Say
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def in_english
    raise ArgumentError, "not in range" unless in_range?(number)
    small_numbers(number) || big(number)
  end

  def small_numbers(number)
    %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen sixteen seventeen eighteen nineteen)[number]
  end

  def big(number)
    tens, ones = number.to_s.chars.map {|number| number.to_i }
    if ones == '0'
      tens(tens)
    else
      "#{tens(tens)} #{small_numbers(ones)}"
    end
  end

  # def big(number)
  #   if perfect_tens?(number)
  #     return tens(number / 10)
  #   else
  #     remainder = number % 10
  #     "#{tens(tens / 10)} #{small_numbers(remainder)}"
  #   end
  # end

  # def perfect_tens?(number)
  #   number % 10 == 0
  # end

  def tens(number)
    "zero ten twenty thirty fourty fifty sixty seventy eighty ninety".split(' ')[number]
  end

  def in_range?(number)
    number >= 0 && number < 100
  end

end
















