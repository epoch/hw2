# Step 1 - grab input from user
print "What do you want to say to Grandma? "
sonny = gets.chomp

# Step 3 - have grandma shout a different year each time; maybe any year at random between 1930 and 1950

    def year 
        rand(1930..1950).to_s
    end

# Step 2 - write when statement for grandma's response

    case sonny
        when sonny = sonny.downcase then puts "    Grandma: HUH?! SPEAK UP, SONNY!"
# Step 4 - You can't stop talking to grandma until you shout BYE.
        when sonny = "BYE" then puts "You just left Grandma"
        else puts "     Grandma: NO, NOT SINCE #{ year }!"
    end

    puts "=" * 60 

# DT'S SOLUTION

#   def no
#     "NO, NOT SINCE #{Random.rand(1930..1950)}."
#   end

#   def bye
#     'BYE, NOW.'
#   end

#   def done?
#     @bye == 3
#   end

#   def track_byes(s)
#     @bye ||= 0
#     if s == 'BYE'
#       @bye += 1
#     else
#       @bye = 0
#     end
#   end

#   def response(s)
#     track_byes s
#     if done?
#       bye
#     elsif s.empty? || s.upcase != s
#       speak_up
#     else
#       no
#     end
#   end

#   def talk
#     begin
#       puts response(gets.chomp)
#     end until done?
#   end
# end






