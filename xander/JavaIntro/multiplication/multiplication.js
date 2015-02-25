
for (var num = 0; num < 10; num = num + 1) {
  var multiplier = 9
  var result = (num * multiplier)
  console.log(num + ' * ' + multiplier + ' = ' + result)
}

// For all multiplication tables

multiplier = 1;
while (multiplier <= 10) {
  for (var num = 0; num < 10; num = num + 1) {
    var result = (num * multiplier)
    console.log(num + ' * ' + multiplier + ' = ' + result)
  }
  multiplier++
}

