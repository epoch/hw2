subway = {
	"N" => ["TIMES SQUARE", "34N", "28N", "23N", "UNION STATION", "8N"],
	"L" => ["8L", "6L", "UNION STATION", "3L", "1L"],
	"S" => ["GRAND CENTRAL", "33S", "28S", "23S", "UNION STATION", "ASTOR PLACE"]
}

puts "Start line? (N, L or S)"
	line_start = gets.chomp.upcase
puts "Start station? #{subway[line_start]}"
	station_start = gets.chomp.upcase

puts "End line? (N, L or S)"
line_end = gets.chomp.upcase

puts "Stop line? #{subway[line_end]}"
station_end = gets.chomp.upcase

if line_start == line_end
	point_a = subway[line_start].index(station_start)
	point_b = subway[line_end].index(station_end)
	distance = (point_b - point_a).abs
	puts "#{distance} stops!"
elsif
	point_a = subway[line_start].index(station_start)
	union_1 = subway[line_start].index("UNION STATION")
	union_2 = subway[line_end].index("UNION STATION")
	point_b = subway[line_end].index(station_end)
	distance = (point_a - union_1).abs + (union_2 - point_b).abs
else
end

puts "#{distance} stops!"
