# given a word and a list of possible anagrams, selects the correct one(s).

# given: "listen" and %w(enlists google inlets banana) the program should return "inlets".

class AnagramDetector

    def initialize(word, possible_anagrams)
        @word = word
        @possible_anagrams = possible_anagrams
    end

    def anagrams
        matches = @possible_anagrams.select {|word| is_anagram?(word)}
        matches
    end

    private

    def is_anagram?(word)
        @word.chars.sort == word.chars.sort
    end
end

a = AnagramDetector.new("listen", %w(enlists google inlets banana))   
puts a.anagrams