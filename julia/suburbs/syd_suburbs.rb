# Create a program that asks what suburbs you live in.
# Depending on the answer, print an appropriate response of your choosing

=begin
print "What suburb do you live in? "
suburb = gets.chomp.capitalize

if suburb == 'Newtown'
	puts "You hipster!"
else
	puts "Aww, that's too bad for you."
end
=end

print "Which suburb do you live in? "
user_suburb = gets.chomp.downcase

def select_suburb(suburb)
	case suburb
	when 'chatswood', 'newtown'
		puts "Good nomming"
	when 'palm beach', 'avalon'
		puts "Long commute"
	else
		puts "I'm sure that's a very nice place..."
	end
end

select_suburb(user_suburb) 


=begin
if suburb == 'chatswood' || suburb == 'newtown'
	puts "Good nomming"
elsif suburb == 'palm beach' || suburb == 'avalon'
	puts "Long commute.."
else
	puts "I'm sure that's a very nice place..."
end
=end






















