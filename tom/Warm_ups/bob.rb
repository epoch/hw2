require 'pry'

class Bob
  def initialize
  end

  def leet_speak(string)
    string = (string.gsub!(/[aeio]/, 'a' => 4, 'e' => 3, 'i' => 1, 'o' => 0)).downcase
  end

  def question?(sentence)
    sentence.include? "?"
  end

  def shouting?(sentence)
    sentence == sentence.upcase
  end

  def chat(user_speech)
    if user_speech.include? "Bro, "
      leet_speak(user_speech)
    elsif question?(user_speech)
      puts "Sure."
    elsif user_speech.length < 1
      puts "Fine. Be that way."
    elsif shouting?(user_speech)
      puts "Woah, chill out!"
    else
      puts "Whatever."
    end
  end
end

bob = Bob.new

binding.pry
