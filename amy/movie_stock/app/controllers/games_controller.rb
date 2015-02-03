class GamesController < ApplicationController

    def games

    end

    def magic_8_ball

    end

    def magic_8_ball_answer

        answers = [
            "It is certain",
            "It is decidedly so",
            "Without a doubt",
            "Yes definitely",
            "You may rely on it",
            "As I see it, yes",
            "Most likely",
            "Outlook good",
            "Yes",
            "Signs point to yes",
            "Reply hazy try again",
            "Ask again later",
            "Better not tell you now",
            "Cannot predict now",
            "Concentrate and ask again",
            "Don't count on it",
            "My reply is no",
            "My sources say no",
            "Outlook not so good",
            "Very doubtful"
        ]

        @answer = answers.sample

    end

    def secret_number

    end

    def secret_number_result

        @user_guess = params[:guess].to_i

        @computer_number = Random.rand(1..10)

         if @user_guess == @computer_number
             render '/games/secret_number_win'
        else
            render '/games/secret_number_lose'
        end
    end


    def rock_paper_scissors

    end

    def rock_paper_scissors_result

    options = [:Rock, :Paper, :Scissors]

    @computer_choice = options.sample

    @user_choice = params[:throw].to_sym

    @tie = "Tie"

        def get_result(user_choice, computer_choice)

            if user_choice == :Rock && computer_choice == :Paper
                @user_result = false
            elsif user_choice == :Rock && computer_choice == :Scissors
                @user_result = true
            elsif user_choice == :Scissors && computer_choice == :Rock
                @user_result = false
            elsif user_choice == :Scissors && computer_choice == :Paper
                @user_result = true
            elsif user_choice == :Paper && computer_choice == :Rock
                @user_result = true
            elsif user_choice == :Paper && computer_choice == :Scissors
                @user_result = false
            elsif user_choice == computer_choice
                @user_result = @tie
            end
        end
        get_result(@user_choice, @computer_choice)
    end

end