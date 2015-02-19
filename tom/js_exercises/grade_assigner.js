// var assignGrade = function(score) {
//   if (score > 90) {
//     console.log("A");
//   } else if (score > 80) {
//     console.log("B");
//   } else if (score > 70) {
//     console.log("C");
//   } else if (score > 60) {
//     console.log("D");
//   } else {
//     console.log("F");
//   }
// };

var grade;
for (var i = 60; i < 101; i++){
  if (i > 90) {
    grade = "A";
  } else if (i > 80) {
    grade = "B";
  } else if (i > 70) {
    grade = "C";
  } else if (i > 60) {
    grade = "D";
  } else {
    grade = "F";
  }

  if (grade === "A") {
    console.log("For " + i + " you got an " + grade);
  } else {
    console.log("For " + i + " you got a " + grade);
  }
};
