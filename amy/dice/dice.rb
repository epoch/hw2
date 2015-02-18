class Dice

    def initialize
        @dice = [1,2,3,4,5,6]
    end

    def roll(num = 1)
        num.times do |dice| 
            @result = puts @dice.sample
        end
    end

    def pretty_roll(num = 1)
        num.times do |dice| 
            @pretty_result = @dice.sample
            case @pretty_result

                when 1
                    puts "
                        _______
                        |      |
                        |   *  |
                        |      |
                        ________

                    "
                when 2
                    puts "
                         ________
                        | *    |
                        |    * |
                        ________

                    "
                when 3
                    puts "
                         ________
                        |    * |
                        |   *  |
                        | *    |
                        ________

                    "
                when 4
                    puts "
                         ________
                        | *  * |
                        | *  * |
                        ________

                    "
                when 5
                    puts "
                         ________
                        | *  * |
                        |   *  |
                        | *  * |
                        ________

                    "
                when 6
                    puts "
                         ________
                        | *  * |
                        | *  * |
                        | *  * |
                        ________

                    "
            end
        end
    end
end

Dice.new.roll
Dice.new.roll(2)
Dice.new.pretty_roll
Dice.new.pretty_roll(4)
