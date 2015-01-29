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
`say "#{Say.new(22).in_english}"`