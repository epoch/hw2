puts "What line are you getting on at? (N, L, or 6)"
line_start = gets.chomp.upcase

if line_start == "N"
	puts "What stop are you getting on at? (Times Square, 34th, 28th, 23rd, Union Square, or 8th)"
	stop_start = gets.chomp
elsif line_start == "L"
	puts "What stop are you getting on at? (8th, 6th, Union Square, 3rd, or 1st)" 
	stop_start = gets.chomp
elsif line_start == "6"
	puts "What stop are you getting on at? (Grand Central, 33rd, 28th, 23rd, Union Square, or Astor Place)" 
	stop_start = gets.chomp
end 

puts "What line are you getting off at? (N, L, or 6)" 
line_end = gets.chomp.upcase

if line_end == "N"
	puts "What stop are you getting on at? (Times Square, 34th, 28th, 23rd, Union Square, or 8th)"
	stop_end = gets.chomp
elsif line_end == "L"
	puts "What stop are you getting on at? (8th, 6th, Union Square, 3rd, or 1st)" 
	stop_end = gets.chomp
elsif line_end == "6"
	puts "What stop are you getting on at? (Grand Central, 33rd, 28th, 23rd, Union Square, or Astor Place)" 
	stop_end = gets.chomp
end 

subway = { 
	"N" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"], 
	"L" => ["8th", "6th", "Union Square", "3rd", "1st"],
	"6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
	}

if line_start == line_end
	puts "#{stop_end} is #{(subway[line_start].index(stop_start).to_i - subway[line_end].index(stop_end).to_i).abs} stops away on Line #{line_end}. Have a nice day!" 
else 
	puts "#{stop_end} is #{(subway[line_start].index("Union Square").to_i - subway[line_start].index(stop_start).to_i).abs + (subway[line_end].index("Union Square").to_i - subway[line_end].index(stop_end).to_i).abs} stops away on Line #{line_end} and you will have to transfer at Union Square. Have a nice day!"
end


