# Remove hardcoded input
# input = 'haha'

class Bob

  def chat(input)
    if input.strip.end_with? '?'
      'Sure'
    elsif input == input.upcase
      'Whoa chill out'
    else input.empty?
      'whatever'
    end
  end

end

bob = Bob.new

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new # optional

class BobTest < Minitest::Test

  def test_ask_question
    bob = Bob.new
    assert_equal "Sure", bob.chat('question?')
  end

    def test_ask_question_with_trailing_spaces
    bob = Bob.new
    assert_equal "Sure", bob.chat('question?   ')
  end

  def test_shouting_at_bob
    bob = Bob.new
    assert_equal "Whoa chill out", bob.chat('YOOOOOOOO!!!')
  end
end

# # This way of testing is slow and repetitive
# puts bob.chat "can you walk into a wall?"
# puts bob.chat "I love pudding"
# puts bob.chat "HI BOB"

# # This way is verifying code works but is long and clunky
# if bob.chat('EAT PIE') == ('Whoa chill out')
#   puts "shouting at bob works"
# else 
#   puts "shouting at bob fails"
# end

# def testing(msg, expected, actual)
#   if expected == actual
#     puts "#{msg} works"
#   else
#     puts "#{msg} fails"
#   end
# end

# testing('shouting at bob', 'Whoa chill out', bob.chat('EAT PIE'))