# Grandma
# Write a Deaf Grandma program.

# Whatever you say to grandma (whatever you type in), she should respond with

# HUH?! SPEAK UP, SONNY!
# unless you shout it (type in all capitals).

# If you shout, she can hear you (or at least she thinks so) and yells back

# NO, NOT SINCE 1938!
# To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950.

# You can't stop talking to grandma until you shout BYE.



# Method 1

loop do 
    puts "Please say something to Grandma: "
    answer = gets.chomp 
    unless answer.empty? 
        if answer == answer.upcase && answer != "BYE"
            puts "Grandma: NO, NOT SINCE 1938."
        elsif answer == "BYE"
            puts "Please say something to Grandma: "
            answer = gets.chomp
            if answer == "BYE"
                puts "Please say something to Grandma: "
                answer = gets.chomp
                if answer == "BYE"
                    break
                end 
            end
        else 
            puts "HUH?! SPEAK UP, SONNY!" 
        end 
    end 
end 

# Method 2

class Grandma
  def speak_up
    "HUH?!  SPEAK UP, SONNY!"
  end

  def no
    "NO, NOT SINCE #{Random.rand(1930..1950)}."
  end

  def bye
    'BYE, NOW.'
  end

  def done?
    @bye == 3
  end

  def track_byes(s)
    @bye ||= 0
    if s == 'BYE'
      @bye += 1
    else
      @bye = 0
    end
  end

  def response(s)
    track_byes s
    if done?
      bye
    elsif s.empty? || s.upcase != s
      speak_up
    else
      no
    end
  end

  def talk
    begin
      puts response(gets.chomp)
    end until done?
  end
end

# Method 3 

def random_year
    rand(1930..1950)
end

def converse
    bye_counter = 0
    time_to_go = false

    until time_to_go
        puts "\nSay something to Grandma"

        input = gets.chomp
        
        sleep 0.5

        print "Grandma: "

        if (input == "BYE") && (bye_counter == 2)
            puts "SEE YA, SONNY!"
            time_to_go = true
        elsif input == "BYE"
            bye_counter += 1
            puts "COME CLOSER AND GIVE GRANNY A KISS!"
        elsif input == input.upcase
            puts "NO, NOT SINCE #{ random_year }!" 
            bye_counter = 0    
        else
            puts "HUH?! SPEAK UP, SONNY!"
            bye_counter = 0
        end

        sleep 1
    end
end

converse

























