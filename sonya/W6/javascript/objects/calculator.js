/*
JavaScript Calculator
Prompt the user to enter an operator and two operands.
Support the following operations: addition, subtraction, multiplication, and division.
Output may appear in the console or in an alert.
Bonus

Support the modulus operator.
Support the square root operator.
Support more than two operands.
*/

var calculate = {
  // converts input from string to Int
  tidy: function(a){
    return parseFloat(a);
  },
  // this. refers to THIS variable of calculate
  add: function(a, b) {
    return this.tidy(a) + this.tidy(b);
  },
  subtract: function (a, b) {
    return this.tidy(a) - this.tidy(b);
  },
  multiply: function (a, b) {
    return this.tidy(a) * this.tidy(b);
  },
  divide: function (a, b) {
    return this.tidy(a) / this.tidy(b);
  }
};

var firstOperand = prompt("Enter your first number?");
var operator = prompt("Enter your operator? +, -, *, / ");
var secondOperand = prompt("Enter your second number?");

var result;

if (operator === '+') {
    result = calculate.add(firstOperand, secondOperand);
  } else if (operator === '-') {
    result = calculate.subtract(firstOperand, secondOperand);
  } else if (operator === '/') {
    result = calculate.divide(firstOperand, secondOperand);
  } else {
    result = "Unknown operator";
}

console.log("The result is " + result);