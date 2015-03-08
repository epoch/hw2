var evenOdd = function() {
  for (var i = 1; i <= 20; i++) {
    if (i % 2 === 0) {
      console.log(i + " is even.");
    } else {
      console.log(i + " is odd.");
    }
  }
}

evenOdd();

var multiplicationTable = function() {
  for (var i = 1; i <= 10; i++) {
    for (var j = 1; j <= 10; j++) {
      console.log(i + " * " + j + " = " + i*j);
    }
  } 
}

multiplicationTable();

var assignGrade = function(score) {
  switch(true) {
    case (score >= 75):
      return "A";
      break;
    case (score >= 65):
      return "B";
      break;
    case (score >= 50):
      return "C";
      break;
    case (score >= 35):
      return "D";
      break;
    case (score >= 0):
      return "E";
      break;
    default:
      return "Unable to grade."
  }
}

var checkGrade = function() {
  for (var i = 60; i <= 100; i++) {
    console.log("For " + i + ", you got a " + assignGrade(i) + ".")
  }
}

checkGrade();

