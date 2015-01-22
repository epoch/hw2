class RockPaperScissors

    # Arguments must be "rock", "paper" or "scissors"
    def initialize(p1_name, p2_name)
        @p1_name = p1_name
        @p2_name = p2_name
    end

    # Returns the winner p1 and p2 are variables that represent hands
    def winner(p1, p2)
        @p1 = p1
        @p2 = p2
        return "draw" if @p1 == @p2

        if @p1 == winning_hand
            @p1_name
        else
            @p2_name
        end
    end

    def generate_hand
        ["rock", "paper", "scissors"].sample
    end

    private 

    def winning_hand
        input = [@p1 , @p2].sort.join('_').to_sym
        rules = { :paper_rock => "paper",
                  :rock_scissor => "rock",
                  :paper_scissor => "scissor"
                }
        rules[input]
    end
end