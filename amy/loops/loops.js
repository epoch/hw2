// https://gist.github.com/wofockham/4c897f89695009b782eb

console.log("hello world");

// Write a for loop that will iterate from 0 to 20. 
// For each iteration, it will check if the current number is even or odd, 
// and report that to the screen (e.g. "2 is even").

for (var i = 0; i <= 20; i = i + 1) {
  if (i % 2 === 0){
    console.log (i + " is even.");
  }else 
    console.log (i + " is false.");
};

// Write a for loop that will iterate from 0 to 10. 
// For each iteration of the for loop, it will multiply the number by 9
// and log the result (e.g. "2 * 9 = 18").

for (var i = 0; i <= 10; i = i + 1) {
    result = i * 9
    console.log(i + " * 9 = " + result);
};

// Bonus: Use a nested for loop to show the tables 
// for every multiplier from 1 to 10 (100 results total).

for (var i = 0; i <= 10; i = i + 1) {
    for (var y = 0; y <= 10; y = y + 1) {
        result = i * y
        console.log(i + " * " + y + " = " + result);
    };
};


// Check the results of assignGrade function from the conditionals exercise 
// for every value from 60 to 100 - so your log should show 
//     "For 89, you got a B. For 90, you got an A.", etc.


var assignGrade = function (score) {
  if (score >= 80) {
    return 'A';
  } else if (score >= 70) {
    return 'B';
  } else if (score >= 60) {
    return 'C';
  } else if (score >= 50) {
    return 'D';
  } else {
    return 'F';
  }
};

for (var i = 60; i <= 100; i = i + 1) {
    grade = assignGrade(i);
    console.log("For " + i + ", you got a " + grade + ".")
};











