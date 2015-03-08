class GamesController < ApplicationController
  
  def home
  end

  def magic_ball
    @question = params[:question]

    answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
    
    @answer = answers.shuffle.sample
  end
  
  def secret_number
    @numbers = [*1..10] 

    @number = params[:number].to_i
    @controller = Random.rand(1..10).to_i
  end

  def rock_paper_scissors
    gesture = ["rock", "paper", "scissors"]
    @gestures = gesture

    @user_throw = params[:throw]
    @program_throw = @gestures.shuffle.sample

    if @user_throw == "rock" && 
      if @user_throw && (@program_throw == "paper")
        "You lose! Try again!"
      elsif @user_throw && (@program_throw == "rock")
        "Draw! Try again!"
      elsif @user_throw && (@program_throw == "scissors")
        "You win! See if you can win again!"
      end

    elsif @user_throw == "paper"
      if @user_throw && (@program_throw == "scissors")
        "You lose! Try again!"
      elsif @user_throw && (@program_throw == "paper")
        "Draw! Try again!"
      elsif @user_throw && (@program_throw == "rock")
        "You win! See if you can win again!"
      end

    elsif @user_throw == "scissors"
      if @user_throw && (@program_throw == "rock")
        "You lose! Try again!"
      elsif @user_throw && (@program_throw == "scissors")
        "Draw! Try again!"
      elsif @user_throw && (@program_throw == "paper")
        "You win! See if you can win again!"
      end

    end

  end

end