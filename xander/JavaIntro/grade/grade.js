var assignGrade = function(grade) {
  if (grade > 90) {
    return ('A');
  } else if (grade <= 90 && grade > 80) {
    return ('B');
  } else if (grade <= 80 && grade > 70) {
    return ('C');
  } else if (grade <= 70 && grade > 60) {
    return ('D');
  } else {
    return ('F');
  }
}

for (var grade = 60; grade <= 100; grade++) {
  var mark = assignGrade(grade);
  console.log('For ' + grade + ' you got a ' + mark + '.')
}