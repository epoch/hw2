# this is messy, look at Joel's solution for reference

class Luhn
  attr_accessor :n

  def initialize(num)
    @num = num.to_s.split('')
  end

  def check_digit
    @num.last.to_i
  end

  def addends
    # @num is currently an array of chars
    @num.map! do |x|
      x.to_i
    end

    # reverse so we can count from the right
    @num.reverse!

    # @num is now array of integers
    @num.map!.with_index do |v, i|
      if i % 2 != 0
        v * 2
        if (v * 2 > 9)
          (v * 2) - 9
        else
          v * 2
        end
      else
        v
      end
    end

    # joel
    # @num.to_s.reverse.chars.map.each_with_index do |digit, i|
    #   digit = digit.to_i
    #   digit = digit * 2 unless i % 2 == 0
    #   digit = digit - 9 if digit >= 10
    #   digit
    # end

    # put digits back into the correct order
    @num.reverse!
  end

  def checksum
    addends
    @sum = @num.inject{|sum,x| sum + x }
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(n)
    test_number = n * 10
    luhn = Luhn.new test_number
    return test_number if luhn.valid?
    test_number + 10 - (luhn.checksum % 10)
  end
end