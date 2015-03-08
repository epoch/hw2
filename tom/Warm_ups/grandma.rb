print "Say something to grandma, you never make the effort to see her anymore: "
grandchild = gets.chomp

bye_count = 0

while bye_count < 3

  if grandchild == grandchild.upcase && grandchild != 'BYE'
    puts "NO, NOT SINCE " + Random.rand(1930..1950).to_s + "!"
    bye_count = 0
  elsif grandchild == 'BYE'
    bye_count += 1
    puts 'Grandma: "I DIDN\'T CATCH THAT!"' if bye_count < 3
  else
    puts "HUH?! SPEAK UP, SONNY!"
    bye_count = 0
  end

  if bye_count < 3
    print "Say something: "
    grandchild = gets.chomp
  end
end

puts 'Grandma: "EVERYBODY LEAVES..."'