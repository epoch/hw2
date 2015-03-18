require 'pry'

class WordProblem

  def initialize(string)
    @string = string
  end

  # def get_nums
  #   # Currently skips out the minus on the second number as it is a non-digit char.
  #   num_regex = /(\-?\d+)\D*(\-?\d+)/
  #   @num_array = @string.match(num_regex)
  # end

  # def answer
  #   get_nums
  #   num1 = @num_array[1].to_i
  #   num2 = @num_array[2].to_i

  #   result = num1 + num2 if @string.include? "plus"
  #   result = num1 - num2 if @string.include? "minus"
  #   result = num1 * num2 if @string.include? "multiplied"
  #   result = num1 / num2 if @string.include? "divided"
  #   result
  # end

  def matches
    @matches = @string.match( /What is (-?\d+) (plus|minus|multiplied by|divided by) (-?\d+)\?/ )
  end

  def answer
    # matches
    # if matches.nil?
    #   raise ArgumentError.new "I don't understand"
    # end
    matches
    # binding.pry
    @answer = @matches[1].to_i.send(operation, @matches[3].to_i)
  end

  def operation
    case @matches[2]
    when 'plus' then :+
    when 'minus' then :-
    when 'multiplied by' then :*
    when 'divided by' then :/
    end
  end

end


