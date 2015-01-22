class EightBall
    def initialize
        f = File.read("quotes.txt")
        @quotes = f.split("\n")
    end

    def shake
        @quotes.sample
    end
end