
require './mta_route.rb'

print "Which is your start line? "
start_line = gets.chomp.downcase
print "Which is your start station? "
start_station = gets.chomp.downcase
print "Which is your ending line? "
ending_line = gets.chomp.downcase
print "Which is your ending station? "
ending_station = gets.chomp.downcase

start = [start_line, start_station]
ending = [ending_line,ending_station]

p route(start, ending)
