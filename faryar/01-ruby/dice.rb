# Quiz - Dice
# Write a program to generate a standard dice roll.

# Dice.roll
# # => 6
# It should give you a different result each time.

# Dice.roll
# # => 5
# Dice.roll
# # => 2
# When you pass in a number, it rolls the dice that many times, and returns you the array of rolled dice

# Dice.roll(3)
# # => [2,5,1]
# Extension

# write another method that display die faces instead of a integer.

# Dice.pretty_roll
# ________
# | *  * |
# | *  * |
# ________

require 'pry'

class Dice 
  def roll(number=1)
    number.times do |dice|
      @result = puts rand(1..6)
    end 
  end 

  def pretty_roll(number=1) 
          number.times do |dice|
          @result = rand(1..6) 
          case @result
            when 1
                    puts "

                        ________
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
  # end


  Dice.new.pretty_roll(3)
  Dice.new.pretty_roll
  Dice.new.roll(3)
  Dice.new.roll




  

