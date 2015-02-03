class Say
  def initialize(number)
    @number = number
  end

  def in_english
    numbers = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
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

    if @number >= 0 && @number <= 99
      if @number <= 20 || @number % 10 == 0
        puts numbers[@number]
      else
        @number_array = @number.to_s.chars
        @number1 = @number_array[0].to_i * 10
        @number2 = @number_array[1].to_i
        puts "#{numbers[@number1]}" + "-" + "#{numbers[@number2]}"
      end
    else
      puts "Sorry, that number is invalid."
    end
  end
end

Say.new(0).in_english
Say.new(14).in_english
Say.new(50).in_english
Say.new(98).in_english
Say.new(-1).in_english
Say.new(100).in_english
Say.new(62).in_english
Say.new(73).in_english
Say.new(25).in_english

system("say < say.rb")