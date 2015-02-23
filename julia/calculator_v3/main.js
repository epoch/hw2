// JavaScript Calculator

// Requirements
// Prompt the user to enter an operator and two operands.
// Support the following operations: addition, subtraction, multiplication, and division.
// Output may appear in the console or in an alert.

// Bonus
// Support the modulus operator.
// Support the square root operator.
// Support more than two operands.

var num1 = prompt('Enter the first number?')
var operation = prompt('Enter the operation(+, -, *, /)?')
var num2 = prompt('Enter the second number?')

// var calculator = function (x, y, operator) {
//   var x = parseInt(x);
//   var y = parseInt(y);

//   if (operator === '+') {
//     var result = x + y;
//     console.log(result);
//     return result;
//   } else if (operator === '-') {
//     var result = x - y;
//     console.log(result);
//     return result;
//   } else if (operator === '*') {
//     var result = x * y;
//     console.log(result);
//     return result;
//   } else if (operator === '/') {
//     var result = x / y;
//     console.log(result);
//     return result;
//   } else {
//     console.log("Invalid operator")
//   };
// }

// calculator(num1, num2, operation);


var calculate = {
  tidy: function(a) {
    return parseFloat(a);
  },

  add: function(a, b) {
    return this.tidy(a) + this.tidy(b);
  },

  subtract: function(a, b) {
    return this.tidy(a) - this.tidy(b);
  },

  multiply: function(a, b) {
    return this.tidy(a) * this.tidy(b);
  },

  divide: function(a, b) {
    return this.tidy(a) / this.tidy(b);
  },

  operate: function(num1, num2, operation) {
    var result;

    if (operation === '+') {
      result = this.add(num1, num2)
    } else if (operation === '-') {
      result = this.subtract(num1, num2)
    } else if (operation === '*') {
      result = this.multiply(num1, num2)
    } else if (operation === '/') {
      result = this.divide(num1, num2)
    } else {
      result = "Invalid operator";
    }
    return result;
  }
};

var result = calculate.operate(num1, num2, operation);
console.log('The result is', result);