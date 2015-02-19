class Anagram

  attr_accessor :word, :array

  def initialize(user_word, array)
    @user_word = user_word
    @array = array

    print "User word: "
    puts @user_word
    puts "\n"
    print "List of possible answers: "
    puts @array.join(', ')
    puts "\n"

    @array.each do |word|
      if @user_word.chars.sort.join == word.chars.sort.join
        puts "Anagram of #{@user_word} is #{word}!"
        puts "\n"

      end
    end

    puts "====================="
    puts "\n"
  end
end
