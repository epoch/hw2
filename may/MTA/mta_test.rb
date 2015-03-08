require './mta_route.rb'

def test(expected, actual, test_name = nil)
  if expected != actual
    puts "Error: expected\n\t#{expected}\nbut got\n\t#{actual}"
    puts "in test '#{test_name}'" unless test_name.nil?
    puts ""
  end
end


test(["8th", "union square", "23rd", "28th", "34th", "times square"],
     route(['n', '8th'],['n', 'times square']),
     "test1")

test(["28th", "23rd", "union square", "8th"], route(['n', '28th'],['n', '8th']), "test2")

test(["8th", "6th", "union square", "3rd", "1st"], route(['l', '8th'],['l', '1st']), "test3")

test(["1st", "3rd", "union square", "6th", "8th"], route(['l', '1st'],['l', '8th']), "test4")

test(["grand central", "33rd", "28th", "23rd"], route(['6', 'grand central'],['6', '23rd']), "test5")

test(["astor place", "union square", "23rd"], route(['6', 'astor place'],['6', '23rd']), "test6")

test(nil, route(['4','iii'],['4','858']), "test7")

test(["8th", "union square", "3rd", "1st"], route(['n', '8th'],['l', '1st']), "test8")

test(["astor place", "union square", "3rd", "1st"], route(['6', 'astor place'],['l', '1st']), "test9")

test(["times square", "34th", "28th", "23rd","union square","23rd","28th","33rd","grand central"], route(['n', 'times square'],['6', 'grand central']), "test10")

test(["3rd", "union square", "23rd", "28th","34th"], route(['l', '3rd'],['n', '34th']), "test11")