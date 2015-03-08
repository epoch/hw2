// The even/odd reporter
// Write a for loop that will iterate from 0 to 20. For each iteration, it will check if the current number is even or odd, and report that to the screen (e.g. "2 is even").

for (var i = 0; i <= 20; i++) {
  if (i % 2 === 0) {
    console.log(i + " is even")
  } else{
    console.log(i + " is odd")
  };
}

// Multiplication Tables
// Write a for loop that will iterate from 0 to 10. For each iteration of the for loop, it will multiply the number by 9 and log the result (e.g. "2 * 9 = 18").

// Bonus: Use a nested for loop to show the tables for every multiplier from 1 to 10 (100 results total).

for (var i = 0; i <= 10; i++) {
  var result = i * 9
  console.log(result);
}

// Bonus: Use a nested for loop to show the tables for every multiplier from 1 to 10 (100 results total).

for (var i = 0; i <= 10; i++) {
 for (var j = 0; j <= 10; j++) {
   var result = i * j;
   console.log(i + ' * ' + j + ' = ' + result);
 }
}

// The Grade Assigner
// Check the results of assignGrade function from the conditionals exercise for every value from 60 to 100 - so your log should show "For 89, you got a B. For 90, you got an A.", etc.

var assignGrade = function(numScore) {
  if (numScore >= 90) {
    return 'A';
  } else if (numScore >= 80 ) {
    return 'B';
  } else if (numScore >= 60) {
    return 'C';
  } else if (numScore >= 50) {
    return 'D';
  } else if (numScore >= 20) {
    return 'E';
  } else {
    return 'F';
  }
}

for (var i = 60; i <= 100; i++) {
  console.log("For " + i + ", you got a " + assignGrade(i))
}